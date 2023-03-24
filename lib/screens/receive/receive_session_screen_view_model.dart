// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/ask_for_duration1/index.dart';
import 'package:warehouse_app/services/services.dart';
import 'package:warehouse_app/services/metadata_service.dart';
import 'package:warehouse_app/view_models/logics/logics.dart';

import 'package:warehouse_app/widgets/widgets.dart';
import 'package:darq/darq.dart';

class ReceiveSessionScreenViewModel extends ViewModelBase {
  final _receiveService = ReceiveService();
  final _metadataService = MetadataService();
  final CheckHasFullDimension _checkHasFullDimension = CheckHasFullDimension();

  final GetInboundRequest _getInboundRequest = GetInboundRequest();

  final ReceiveModel session;
  final ConditionType conditionType;
  final ReceiveTask? receiveTask;

  late InboundResponse? originalResponse;
  final TransportControl transportControl = TransportControl();
  final ReceivedList _receivedList = ReceivedList();

  TextEditingController controller = TextEditingController();
  String scannedBarcode = "";
  int? _rememberQuantity;
  bool _isAwaitingSku = false;
  bool cargoSelected = false;

  final durationMapper = <String, ProductDuration>{};
  final lotNumberMapper = <String, String>{};

  MapEntry<ReceivedItem, List<CheckListItem>>? recentList;

  int _serialIndex = -1;
  bool _isNewScan = false;

  ReceiveProduct? _processingItem;

  ReceiveSessionScreenViewModel({
    required this.conditionType,
    required this.session,
    this.receiveTask,
  });

  init() {
    _loadData();
  }

  _loadData() async {
    setBusy(true);
    await fetchInboundResponse();
    if (receiveTask != null) {
      resume();
    }

    setBusy(false);
  }

  Future fetchInboundResponse() async {
    final loaded = await _getInboundRequest.execute(session.irId!);

    if (loaded != null) {
      originalResponse = loaded;
    }
  }

  void scan(BuildContext context, String barcode) async {
    if (originalResponse == null) {
      print("show error here");
      return;
    }

    final parts = barcode.trim().split("|");
    final code = parts[0];

    if (parts.length > 1) {
      _rememberQuantity = int.tryParse(parts[1]) ?? 1;
    } else {
      _rememberQuantity = 1;
    }

    if (_rememberQuantity == null) {
      print("shhow error hhere err_invalid_data");
      return;
    }

    setProcessing(true);

    if (!transportControl.isOpen()) {
      await _checkInTransport(context, code);
      _isAwaitingSku = true;
      setProcessing(false);
      return;
    }

    if (transportControl.requestClose(code)) {
      // CloseCurrentTransport
      setProcessing(false);
      return;
    }

    _isNewScan = true;
    if (_processingItem == null) {
      await _codeCheck(context, code, _rememberQuantity!);

      setProcessing(false);
      return;
    }

    await _ifSerial(context, _processingItem!, code);
    setProcessing(false);
  }

  Future _ifSerial(
      BuildContext context, ReceiveProduct product, String code) async {
    if (product.isSku(code)) {
      _processingItem = null;

      DialogService.showErrorBotToast("Mã serial không hợp lệ");
      return;
    }

    if ((product.attributes == null || product.attributes!.isEmpty) &&
        !product.isCargo()) {
      return _processReceive(
          product: product,
          quantity: 1,
          lotNumber: lotNumberMapper[product.sku],
          duration: durationMapper[product.sku],
          serial: code);
    }

    final serialIndex = _getInboundRequest.haveStorageCode(code);
    if (serialIndex < 0) {
      _processingItem = null;
      DialogService.showErrorBotToast("Serial không đúng");
      return;
    }

    final productAttributes = _getInboundRequest.productAttribute(serialIndex);
    if (product.isCargo() && productAttributes!.requireWeight() == true) {
      _serialIndex = serialIndex;
      // RequestWeightInput(productAttributes.storageCode))

      return;
    }

    _processReceive(
        product: product,
        quantity: 1,
        duration: durationMapper[product.sku],
        lotNumber: lotNumberMapper[product.sku],
        serial: code);

    _getInboundRequest.removeStorageCode(serialIndex);
  }

  Future _codeCheck(BuildContext context, String code, int quantity) async {
    if (originalResponse == null) {
      return;
    }

    ReceiveProduct? check;
    if (originalResponse!.detail != null) {
      check =
          originalResponse!.detail!.firstWhereOrDefault((e) => e.isSku(code));
    }

    if (check != null) {
      await _foundSku(context, check, code, quantity);
      return;
    }

    await _foundNoSku(context, code, quantity);
  }

  Future _foundNoSku(BuildContext context, String code, int quantity) async {
    _serialIndex = -1;
    final transportCheck = await _metadataService.checkTransportAvailable(code);
    if (transportCheck.hasError) {
      return;
    }

    if (transportCheck.data!.checkedPhysicalType) {
      if (transportCheck.data!.checkedStatus) {
        // SwitchTransport(code)
        return;
      } else {
        DialogService.showErrorBotToast(
            "Thiết bị chứa hàng $code không khả dụng");
      }
    } else {
      if (_isNewScan) {
        _isNewScan = false;
        _getInboundRequest.execute(session.irId!);
        _codeCheck(context, code, quantity);
      } else {
        DialogService.showErrorBotToast("Không tìm thấy sản phẩm");
      }
    }
  }

  Future _foundSku(BuildContext context, ReceiveProduct check, String code,
      int quantity) async {
    check = check.copyWith(sku: code);

    final result = await _receiveService.currentReceiveQuantity(
        session.irId!, check.productId!, quantity, check.unitId!);

    if (result.hasError) {
      return;
    }

    if (result.data == true) {
      DialogService.showWarningBotToast(
          "Không thể nhận hàng vượt quá số lượng của yêu cầu nhập kho.");
      return;
    }

    await _checkProduct(context, check, quantity);
  }

  Future _checkProduct(
      BuildContext context, ReceiveProduct check, int quantity) async {
    ProductDuration? duration;
    String? lotNumber;
    _processingItem = check;

    if (check.missingDimensions()) {
      final hasFulDimension = await _checkHasFullDimension.hasFullDimension(
          check.productId!, check.unitId!);
      if (!hasFulDimension) {
        _showUpdateDimension(context, check);
        return;
      }
    }

    duration = durationMapper[check.sku];
    lotNumber = lotNumberMapper[check.sku];

    if (check.isExpiryDate == true || check.isLotNumber == true) {
      final checkDuration = duration == null && check.isExpiryDate == true;
      final checkLotNumber = lotNumber == null && check.isLotNumber == true;

      if (checkDuration || checkLotNumber) {
        _showAskForDuration(context, check, checkDuration, checkLotNumber);

        return;
      }

      final unitId = _getInboundRequest.unitId(check.sku);

      if (unitId == null) {
        // RequestUnitSelection
        _showRequestUnitSelection(context);
        return;
      }

      final productAttributes =
          _getInboundRequest.productAttribute(_serialIndex);
      if (_serialIndex != -1 && check.isCargo()) {
        if (productAttributes?.requireWeight() == true) {
          //   RequestWeightInput(productAttributes.storageCode)
          _showRequestWeightInput(context, productAttributes?.storageCode);
          return;
        }
      }

      if (!check.isNonSerial()) {
        if (quantity > 1) {
          //SerialTypeMustBeIndividual(check.sku, check.type == ProductType.SERIAL)
          return;
        } else {
          if (productAttributes == null) {
            _isAwaitingSku = false;
            //AskForSerial(duration)
            _showRequestSerialInput(context, duration);
            return;
          }

          await _processReceive(
              product: check,
              quantity: quantity,
              duration: duration,
              lotNumber: lotNumber,
              serial: productAttributes.storageCode!);
          _getInboundRequest.removeStorageCode(_serialIndex);
        }
        return;
      }
    }

    await _processReceive(
        product: check,
        quantity: quantity,
        lotNumber: lotNumber,
        duration: duration);
  }

  Future _processReceive({
    required ReceiveProduct product,
    required int quantity,
    ProductDuration? duration,
    String? lotNumber,
    String? serial,
  }) async {
    if (duration != null) {
      duration.calculate();
    }

    final payload = CheckingProduct(
      barcode: product.sku,
      unitId: _getInboundRequest.unitId(product.sku),
      type: product.type,
      qty: quantity,
      date: duration,
      serial: serial,
      lotNumber: lotNumber,
    );

    final res = await _receiveService.processProduct(
        session.code!, transportControl.sessionId!, payload);

    if (res.hasError) {
      _processingItem = null;
      return;
    }

    _cleanProcessing();
    _isAwaitingSku = true;
    final attrIndex = _serialIndex;

    final String weight =
        _getInboundRequest.productAttribute(attrIndex)?.formatWeight() ?? "";

    recentList = _receivedList.add(product, payload, quantity, weight);
  }

  Future _checkInTransport(BuildContext context, String transportCode) async {
    final result = await _receiveService.receiveCheckInTransport(
      session.code!,
      CheckInTransportRequest(
          conditionType: conditionType.conditionTypeId!,
          transportCode: transportCode),
    );

    if (!result.hasError) {
      _receivedList.clear();
      transportControl.open(transportCode, result.data!.id!);
      scannedBarcode = "";
      return;
    }
  }

  void processInput(BuildContext context, String barcode) {
    scannedBarcode = barcode;
    controller.text = scannedBarcode;

    if (cargoSelected && !barcode.contains("|") && _isSku(barcode.trim())) {
      _showInputQuantityDialog(context, barcode.trim());
      return;
    }

    scan(context, barcode);
  }

  void resume() {
    if (receiveTask == null) {
      return;
    }

    transportControl.open(receiveTask!.locationCode!, receiveTask!.sessionId!);
  }

  bool hasCurrentCode() {
    return transportControl.currentCode != null;
  }

  void finish(BuildContext context) async {
    if (!transportControl.isOpen()) {
      DialogService.showBotToast("Chưa có seesion", Colors.deepOrange);
      Navigator.pop(context);
      return;
    }

    final confirm = await DialogService.confirmDialog(context,
        title: "Kết thúc",
        message: "Bạn có muốn kết thúc công việc?",
        yesLabel: "Có",
        noLabel: "Không");

    if (!confirm) {
      return;
    }

    setProcessing(true);

    final result = await _receiveService.receiveCheckOutTransport(
        session.code!, transportControl.sessionId!);

    if (result.hasError) {
      setProcessing(false);
      return;
    }

    transportControl.close();
    DialogService.showBotToast("Success", Colors.green);

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  void cargoSelectedChanges(bool value) {
    cargoSelected = value;
    notifyListeners();
  }

  void _cleanProcessing() {
    _processingItem = null;
    _serialIndex = -1;
  }

  bool canFinish() {
    return _processingItem == null;
  }

  void _showUpdateDimension(BuildContext context, ReceiveProduct product) {
    //
  }

  void _showAskForDuration(BuildContext context, ReceiveProduct product,
      bool requiredDuration, bool requiredLotNumber) async {
    final duration = await DialogService.showBottomSheet<DurationValue>(
      context,
      chid: AskForDurationScreen(
        product: product,
        needDuration: requiredDuration,
        needLotNumber: requiredLotNumber,
      ),
      title: "Chi tiết sản phẩm",
      canDismiss: false,
    );

    if (duration == null) {
      return;
    }

    ProductDuration? productDuration = !requiredDuration
        ? null
        : ProductDuration(
            expireD: duration.expireDate,
            issueD: duration.issueDate,
            bestUseD: duration.bestUseD);

    final lotNumber = requiredLotNumber ? duration.lotNumber : null;

    if (_processingItem != null) {
      final sku = _processingItem!.sku;
      if (duration != null) {
        durationMapper[sku] = productDuration!;
      }

      if (lotNumber != null) {
        lotNumberMapper[sku] = lotNumber;
      }

      Future.delayed(const Duration(milliseconds: 200));

      setProcessing(true);
      await _checkProduct(context, _processingItem!, _rememberQuantity!);
      setProcessing(false);
    }
  }

  void _showRequestUnitSelection(BuildContext context) {
    //
  }

  void _showRequestWeightInput(BuildContext context, String? code) {
    //
  }

  void _showRequestSerialInput(
      BuildContext context, ProductDuration? duration) {
//
  }

  void _showInputQuantityDialog(BuildContext context, String code) {
    //
  }

  bool _isSku(String code) {
    if (_isAwaitingSku) {
      final inboundRespond = _getInboundRequest.originalResponse;
      if (inboundRespond.detail == null) {
        return false;
      }

      final p =
          inboundRespond.detail!.firstWhereOrDefault((it) => it.isSku(code));
      return p != null && p.isNonSerial();
    }

    return false;
  }
}
