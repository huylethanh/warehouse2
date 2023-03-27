// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/put_away/quantity_input.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/widgets/widgets.dart';

class PutAwayScreenViewModel extends ViewModelBase {
  final RegisterTransport registerTransport = RegisterTransport();
  final transportRuleControl = TransportRuleControl();
  final queryInfoAtLocation = QueryInfoAtLocation();
  final registerBin = RegisterBin();
  final processPutAway = ProcessPutAway();
  final putAllIn = PutAllIn();
  final finishPutAwaySession = FinishPutAwaySessio();

  int sessionId = 0;

  // check box
  bool gettingCargo = false;
  String scannedBarcode = "";

  OPS operation = OPS.REG_TRANSPORT;
  int total = 0;
  bool isAwaitingSku = false;
  bool cargoSelected = false;
  NewTransport? newTransport;
  CheckCodeResponse? checkCodeResponse;

  Future<void> resume(PutAwayTask task) async {
    setBusy(true);
    operation = OPS.RESUMING;

    registerTransport.resume(task.sessionId!, task.locationCode!);

    final current = await queryInfoAtLocation.stow(task.locationCode!);

    if (current.isEmpty) {
      total = 0;
      registerBin.clear();
      registerTransport.clear();
      transportRuleControl.clear();

      return;
    }

    finishPutAwaySession.startProgress();
    final checkList = transportRuleControl.perceive(current);

    total = checkList.fold(0, (sum, it) {
      return sum + it.amount;
    });

    newTransport = NewTransport(
        transportCode: task.locationCode,
        total: total,
        checkList: checkList,
        partner: task.partnerName ?? "",
        weight: task.totalWeight != null
            ? "${(task.totalWeight! / 1000).toStringAsFixed(2)} kg"
            : "");

    setBusy(false);
  }

  processInput(BuildContext context, String scannedBarcode) async {
    String barcode = scannedBarcode.trim();
    if (gettingCargo && scannedBarcode.contains("|") && _isSku(barcode)) {
      final quantity = await DialogService.showBottomSheet<int>(context,
          canDismiss: false,
          chid: const QuantityInput(),
          title: "Nhập số lượng");

      if (quantity == null) {
        return;
      }

      scan(context, "$barcode|$quantity!");

      return;
    }

    scan(context, barcode);
  }

  void cargoSelectedChanges(bool value) {
    cargoSelected = value;
    notifyListeners();
  }

  bool _isSku(String barcode) {
    return true;
  }

  Future<void> scan(BuildContext context, String barcode) async {
    final parts = barcode.split("|");
    final code = parts[0];

    final quantityString = parts.getOrElse<String>(1, (index) {
      return "1";
    });

    final quantity = int.tryParse(quantityString);

    if (quantity == null) {
      DialogService.showErrorBotToast("Mã serial không hợp lệ");
    }

    setProcessing(true);

    if (registerTransport.current() == null) {
      await _registerTransport(code);
      setProcessing(false);
      return;
    }

    if (registerBin.current() == null) {
      await _registerBin(code);
      setProcessing(false);
      return;
    }

    final currentBin = registerBin.current();

    if (transportRuleControl.hasProcessingSku()) {
      if (!isNullOrEmpty(currentBin)) {
        await _process(context, code, currentBin!, quantity!);
      }
    } else {
      final currentTransport = registerTransport.current() ?? "";
      if (currentTransport.toUpperCase().compareTo(code.toUpperCase()) == 0 &&
          transportRuleControl.hasDone()) {
        await _putAllIn(context, registerBin.current() ?? "none");
        setProcessing(false);
        return;
      }

      await _process(context, code, currentBin!, quantity!);
    }

    setProcessing(false);
  }

  bool wasFinished() {
    return finishPutAwaySession.finished ||
        !finishPutAwaySession.progressStarted;
  }

  Future<void> endSession(BuildContext context) async {
    final confirmed = await DialogService.confirmDialog(
      context,
      title: "Kết thúc",
      message: "Bạn có muốn kết thúc công việc?",
      yesLabel: "Chấp nhận",
      noLabel: "Hủy",
    );

    if (!confirmed) {
      return;
    }

    setProcessing(true);

    await _finish();

    setProcessing(false);

    Navigator.pop(context);
  }

  Future<void> _putAllIn(BuildContext context, String bin) async {
    final confirmed = await DialogService.confirmDialog(
      context,
      title: "Đưa tất cả sản phẩm lên vị trí",
      message: "Lưu ý hành động này không thể hoàn tác.",
      yesLabel: "Chấp nhận",
      noLabel: "Hủy",
    );

    if (!confirmed) {
      return;
    }

    final transportCode = registerTransport.current();

    if (isNullOrEmpty(transportCode)) {
      return;
    }

    final bin = registerBin.current();

    if (isNullOrEmpty(bin)) {
      return;
    }

    operation = OPS.PROCESS;

    putAllIn.execute(registerTransport.sessionId, transportCode!, bin!);

    total = 0;
    registerBin.clear();
    registerTransport.clear();
    transportRuleControl.clear();
    isAwaitingSku = false;

    final result = await _finish();
  }

  void _changeBIN(BuildContext context, CheckCodeResponse value) async {
    final confirmed = await DialogService.confirmDialog(
      context,
      title: "Đổi kho",
      message:
          "Bạn có chắc muốn chuyển sang vị trí lưu kho ${value.locationCode}",
      yesLabel: "Chấp nhận",
      noLabel: "Hủy",
    );

    if (!confirmed) {
      return;
    }

    registerBin.updateBin(value);
  }

  Future<bool> _finish() async {
    final result = await finishPutAwaySession.execute(
        registerTransport.sessionId, transportRuleControl.hasDone());
    return result;
  }

  Future<void> _process(
      BuildContext context, String code, String bin, int quantity) async {
    if (transportRuleControl.hasProcessingSku()) {
      final found = transportRuleControl.find(code);

      if (found > -1) {
        _submit(bin, found);
      } else {
        transportRuleControl.cleanProcessing();
        DialogService.showErrorBotToast("Mã serial không hợp lệ");
      }
      isAwaitingSku = true;
      return;
    }

    final found = transportRuleControl.query(code);
    if (found > -1) {
      final product = transportRuleControl.getAt(found);

      // product was found with SERIAL
      if (product.serial == code) {
        _submit(bin, found);
      } else {
        // product was found with SKU
        if (product.hasSerial()) {
          isAwaitingSku = false;
          transportRuleControl.saveProcessingSku(product.sku!);
          await _askForSerial(context, product);
        } else {
          _submit(bin, found, quantity: quantity);
        }
      }

      return;
    }

    final assertBin = await registerBin.checkBin(code, isPutAway: true);
    if (assertBin != null) {
      _changeBIN(context, assertBin);

      return;
    }

    DialogService.showErrorBotToast("Không tìm thấy sản phẩm");
  }

  Future<void> _askForSerial(BuildContext context, InboundProduct product) {
    operation = OPS.SERIAL_SCAN;
    // show product on UI
    return Future.value();
  }

  Future<void> _submit(String bin, int productIndex, {int quantity = 1}) async {
    final product = transportRuleControl.getAt(productIndex);

    final result = await processPutAway.execute(registerTransport.sessionId,
        registerTransport.current() ?? "", bin, product, quantity);

    final saved = PutAwayitem(product, quantity);
    final checkList = transportRuleControl.update(productIndex, quantity);

    if (transportRuleControl.hasDone()) {
      total = 0;
      registerBin.clear();
      registerTransport.clear();
      transportRuleControl.clear();
      isAwaitingSku = false;

      newTransport = newTransport!.copyWith(checkList: checkList, total: total);
      return;
    }

    total -= quantity;

    newTransport = newTransport!.copyWith(checkList: checkList, total: total);
  }

  String getStepMessage() {
    switch (operation) {
      case OPS.REG_TRANSPORT:
        return "Quét thiết bị chứa hàng";

      case OPS.RESUMING:
      case OPS.REG_BIN:
        return "Quét vị trí lưu kho";

      case OPS.PROCESS:
        return "Scan SERIAL/Barcode/Bin/Tote code";

      case OPS.SERIAL_SCAN:
        return "Quét mã SERIAL";

      default:
        throw Exception("not support $operation");
    }
  }

  Future<void> _registerTransport(String code) async {
    final transport = await registerTransport.execute(code);

    if (transport == null) {
      return;
    }

    final session = transport.key;
    final data = transport.value;

    finishPutAwaySession.startProgress();
    final checkList = transportRuleControl.perceive(data);

    total = checkList.fold(0, (sum, it) {
      return sum + it.amount;
    });

    newTransport = NewTransport(
        transportCode: code,
        total: total,
        checkList: checkList,
        partner: session.partnerName ?? "",
        weight: session.totalWeight != null
            ? "${(session.totalWeight! / 1000).toStringAsFixed(2)} kg"
            : "");

    operation = OPS.REG_BIN;
  }

  Future<void> _registerBin(String code) async {
    final success = await registerBin.execute(code, isPutaway: true);

    if (!success) {
      DialogService.showErrorBotToast("Vị trí lưu kho không đúng");
      return;
    }

    isAwaitingSku = true;

    operation = OPS.PROCESS;

    checkCodeResponse = registerBin.registeredBin;
  }
}
