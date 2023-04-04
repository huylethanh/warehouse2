// ignore_for_file: use_build_context_synchronously

import 'package:darq/darq.dart';
import 'package:flutter/cupertino.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/views/views.dart';
import 'package:warehouse_app/utils/colection.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'helpers/bin_pick_controller.dart';
import 'models/A_pick.dart';
import 'models/bin.dart';
import 'models/models.dart';

enum TASK { REG_SINGLE_TRANSPORT, REG_TRANSPORTS, GET_PATH, PROCESS }

class PickingSessionScreenViewModel extends ViewModelBase {
  late ORPicking orPicking;

  final _pickController = BinPickController();
  final _abortPickingSession = AbortPickingSession();
  final _finishPickingUp = FinishPickingUp();
  final _getPath = GetPath();
  final _checkTransportAvailable = CheckTransportAvailable();
  final _registerPickingTransport = RegisterPickingTransport();
  final _getSingleOr = GetSingleOr();
  final _pickAllInBin = PickAllInBin();
  final _skipProduct = SkipProduct();
  final _processPicking = ProcessPicking();

  String? currentCode;
  int count = 0;
  bool gettingCargo = false;
  bool _enoughTransport = false;
  bool allDone = false;
  bool requestingChangePath = false;
  String? skuAwaitSerial;

  TASK task = TASK.REG_SINGLE_TRANSPORT;
  Map<TASK, TASK> tasksDone = {
    TASK.REG_SINGLE_TRANSPORT: TASK.REG_SINGLE_TRANSPORT
  };

  PickingSessionScreenViewModel();

  init(ORPicking orPicking) {
    this.orPicking = orPicking;
  }

  String getStepName() {
    switch (task) {
      case TASK.REG_SINGLE_TRANSPORT:
        return "Quét thiết bị chứa hàng";

      case TASK.GET_PATH:
        return "Quét vị trí lấy hàng";

      default:
        return "";
    }
  }

  bool showSkip() {
    return task != TASK.REG_SINGLE_TRANSPORT;
  }

  void doAction(BuildContext context, String barcode) {
    switch (task) {
      case TASK.REG_SINGLE_TRANSPORT:
        registerTransport(barcode);

        break;
      default:
        processInput(context, barcode);
        return;
    }
  }

  Future<void> processInput(BuildContext context, String barcode) async {
    barcode = barcode.trim();
    if (_enoughTransport) {
      if (gettingCargo && !barcode.contains("|") && isSku(barcode)) {
        _inputQuantityDialog(context, barcode.trim());
      } else {
        await scan(context, barcode);
      }

      return;
    }

    await registerTransport(barcode);
  }

  void cargoSelectedChanges(bool value) {
    gettingCargo = true;
    notifyListeners();
  }

  bool isSku(String code) {
    if (_pickController.processing == null) {
      return false;
    }

    final p = _pickController.processing;
    return p!.checkSku(code) && !p.isSerial();
  }

  void set(ORPicking or) {
    orPicking = or;
  }

  Future<void> resume(PickUpTask task) async {
    orPicking = ORPicking(
        id: task.id,
        code: "",
        orderCount: 0,
        productCount: 0,
        sizeName: null,
        createdDate: null,
        numOfTransport: 0,
        priority: 0);

    setProcessing(true);

    await getPickingPath();

    setProcessing(false);

    //_enoughTransport = true;
    //notifyListeners();
  }

  bool canPickAllInBin() {
    return _pickController.processing?.canPickAll == true;
  }

  String currentSku() {
    return _pickController.processing?.product.barcode ?? "n/a";
  }

  Future<void> cancel() async {
    task = TASK.REG_SINGLE_TRANSPORT;
    setProcessing(true);

    await _abortPickingSession.execute(orPicking.id!);

// might need to go back the list view
    setProcessing(false);
  }

  Future<void> finish(BuildContext context) async {
    const title = "Bỏ qua";
    var message = "";

    if (_enoughTransport) {
      message = "Bạn có chắc muốn bỏ qua sản phẩm ${currentSku()}?";
    } else {
      message = "Bạn có chắc muốn hủy phiên pick-up hiện tại?";
    }

    final confirmed = await DialogService.confirmDialog(context,
        title: title, message: message);
    if (!confirmed) {
      if (_enoughTransport) {
        skip();
      } else {
        // cancel();
      }
    }
  }

  Future<void> _finish() async {
    setProcessing(true);
    task = TASK.PROCESS;

    await _finishPickingUp.execute(orPicking.id!, _getPath.sessionId());
    // might need to go back the list view

    setProcessing(false);
  }

  Future<void> _inputQuantityDialog(
      BuildContext context, String barCode) async {
    final result = await DialogService.showBottomSheet<int>(context,
        chid: const QuantityInput(), title: "Nhận số lượng cho SKU");

    if (result == null) {
      return;
    }

    scan(context, "$barCode|$result");
  }

  Future<void> registerTransport(String barcode) async {
    String code = barcode.trim().toUpperCase();

    task = TASK.REG_SINGLE_TRANSPORT;
    tasksDone[TASK.REG_SINGLE_TRANSPORT] = TASK.REG_SINGLE_TRANSPORT;

    setProcessing(true);
    final checkTransport = await _checkTransportAvailable.simpleCheck(code);
    final regTrasport = _registerPickingTransport.register(code);

    if (checkTransport && regTrasport) {
      //  _registerTransport.postValue(Resource.Success(SingleAdded(code)))

      if (_registerPickingTransport.count() == orPicking.numOfTransport) {
        task = TASK.REG_TRANSPORTS;
        tasksDone[TASK.REG_TRANSPORTS] = TASK.REG_TRANSPORTS;
        await _registerPickingTransport.execute(orPicking.id!);

        await getPickingPath();
      }
    } else {
      DialogService.showErrorBotToast(
          "Thiết bị chứa hàng $code không khả dụng");
    }
    setProcessing(false);
  }

  Future<void> regTransports(bool orChanged) async {
    task = TASK.REG_TRANSPORTS;

    setProcessing(true);

    if (orChanged) {
      final data = await _getSingleOr.execute(orPicking.id!);
      if (data != null) {
        orPicking = data;
      }
    } else {
      _registerPickingTransport.execute(orPicking.id!);
    }

    setProcessing(false);
  }

  Future<void> getPickingPath() async {
    setProcessing(true);
    final data = await _getPath.execute(orPicking.id!);
    if (data != null) {
      orPicking = data;

      count = _getPath.outCount;

      await start();

      setProcessing(false);
    }

    tasksDone[TASK.GET_PATH] = TASK.GET_PATH;
    setProcessing(false);
  }

  Bin? bin;
  Future<void> start() async {
    task = TASK.GET_PATH;

    if (_getPath.hasNext()) {
      final next = _getPath.next();
      _pickController.createNewPhase(next);

      bin = Bin(next.firstOrDefault(defaultValue: null)?.bin ?? "N/A", null);
    } else {
      allDone = true;
    }
  }

  Future<void> pickAllInBin() async {
    setProcessing(true);

    task = TASK.PROCESS;

    //return Future.value();

    if (_pickController.processing == null) {
      return;
    }

    APick processing = _pickController.processing!;

    final location = PickingLocation(
        pickListId: orPicking.id!,
        pickSessionId: _getPath.sessionId(),
        binLocationId: processing.binId,
        pickUpLocationId: processing.transport.id!);

    final response = await _pickAllInBin.execute(location);

    if (response == null) {
      setProcessing(false);
      return;
    }

    if (response.isAlternated()) {
      alternate(response, null);
      return;
    }

    final quantity = _pickController.count();
    count += quantity;

    final product = PickingProduct(
        productId: 0,
        sku: "n/a",
        quantity: quantity,
        typeLabel: "",
        unitId: 0,
        serial: null);

    final last = LastPicked(
        total: count,
        need: 0,
        bin: processing.bin,
        transport: processing.transport,
        product: product);

    if (_getPath.hasNext()) {
      final nextBin = _getPath.next();
      _pickController.createNewPhase(nextBin);

      //    _process.postValue(Resource.Success(Bin(nextBin.firstOrNull()?.bin ?: "n/a", last)))
    } else {
      // travels to all BIN -> done
      allDone = true;
      //  _process.postValue(Resource.Success(AllDone(last = last)))
    }
  }

  Future<void> skip() async {
    task = TASK.PROCESS;

    final removing = _pickController.processing;

    if (removing == null) {
      DialogService.showErrorBotToast("Đã có lỗi");
      return;
    }

    final location = PickingLocation(
        pickListId: orPicking.id!,
        pickSessionId: _getPath.sessionId(),
        binLocationId: removing.binId,
        pickUpLocationId: removing.transport.id!);

    final product = PickingProduct(
        productId: removing.product.productBarcodeId,
        sku: removing.product.barcode,
        quantity: removing.remaining(),
        typeLabel: removing.product.isAttribute() ? "Nhãn lưu trữ" : "Serial",
        unitId: removing.product.unitId,
        serial: null);

    final newPath = await _skipProduct.execute(
        orPicking.id!, _getPath.sessionId(), location, product);

    if (newPath == null) {
      DialogService.showErrorBotToast("Đã có lỗi");
      return;
    }

    orPicking = await _getPath.execute2(newPath);
    count = _getPath.outCount;

    if (_getPath.hasNext()) {
      final next = _getPath.next();
      _pickController.createNewPhase(next);

      if (_pickController.checkBin(removing.bin)) {
        if (_pickController.processing != null) {
          // _process.postValue(Resource.Success(Next(it)))
        }
      } else {
        //TOTO: check here
        //    _process.postValue(
        //                       Resource.Success(
        //                           Bin(
        //                               next.firstOrNull()?.bin ?: "n/a"
        //                           )
        //                       )
        //                   )
        // }
      }
    } else {
      //TOTO: check here
      allDone = true;
      // _process.postValue(Resource.Success(AllDone(last = null)))
    }
  }

  Future<void> scan(BuildContext context, String barcode) async {
    if (allDone) {
      return;
    }

    // _process.value = Resource.Loading()
    task = TASK.PROCESS;

    final normalize = barcode.trim();

    final parts = normalize.split("|");

    final code = parts[0];

    final quantityString = parts.getOrElse<String>(1, (index) {
      return "1";
    });

    final quantity = int.tryParse(quantityString);

    if (quantity == null) {
      //_process.postValue(Resource.Error(getString(R.string.err_invalid_data)))
      return;
    }

    if (!_pickController.binVerified()) {
      if (_pickController.checkBin(code)) {
        if (_pickController.processing != null) {
          //_process.postValue(Resource.Success(Next(it)))
        }
      } else {
        DialogService.showErrorBotToast("Vị trí lưu kho không đúng");
        return;
        //_process.postValue(Resource.Error(getString(R.string.err_invalid_bin)))
      }
      return;
    }

    if (skuAwaitSerial == null) {
      if (code.toUpperCase() == _pickController.processingBin!.toUpperCase()) {
        /*if (orPicking.orderCount == 1) {
                    _process.postValue(Resource.Success(AllInBin(code)))
                } else if (!canPickAllInBin()) {
                    _process.postValue(Resource.Error("Vị trí lấy hàng $code không hỗ trợ lấy toàn bộ sản phẩm"))
                } else {
                    _process.postValue(Resource.Error("Không hỗ trợ phiên lấy hàng có nhiều hơn 1 đơn hàng"))
                }*/
        if (canPickAllInBin()) {
          // _process.postValue(Resource.Success(AllInBin(code)))
        } else {
          DialogService.showErrorBotToast(
              "Vị trí lấy hàng $code không hỗ trợ lấy toàn bộ sản phẩm");
          // _process.postValue(Resource.Error(getString(R.string.txt_pick_location_cant_pick_all, code)))
        }
        return;
      }

      if (quantity > 1 && _pickController.isSerial()) {
        DialogService.showErrorBotToast(
            "Sản phẩm là serial không được lấy quá 1");
        return;
      }

      if (_pickController.overQuantity(quantity)) {
        DialogService.showErrorBotToast("Số lượng vượt quá số lượng cần lấy");
        return;
      }

      if (_pickController.containsStorageCode(code)) {
        if (_pickController.processing != null) {
          process(_pickController.processing!, quantity, code);
        }

        return;
      }

      final isSku = _pickController.checkSku(code);
      final maybeSerial =
          _pickController.isSerial() && _pickController.notSkuInBin(code);
      if (isSku || maybeSerial) {
        if (isSku && _pickController.isSerial()) {
          skuAwaitSerial = code;
          //     _process.postValue(Resource.Success(AwaitSerial))
        } else {
          if (_pickController.emptyStorageCode()) {
            if (_pickController.processing != null) {
              process(_pickController.processing!, quantity,
                  maybeSerial ? code : null);
            }
          } else {
            // _process.postValue(Resource.Error(getString(R.string.err_wrong_sku)))
            DialogService.showErrorBotToast("Barcode không đúng");

            return;
          }
        }
      } else {
        //_process.postValue(Resource.Error(getString(R.string.err_wrong_sku)))
        DialogService.showErrorBotToast("Barcode không đúng");
      }
    } else {
      if (_pickController.notSkuInBin(code) &&
          (_pickController.emptyStorageCode() ||
              _pickController.containsStorageCode(code))) {
        if (_pickController.processing != null) {
          process(_pickController.processing!, 1, code);
        }
      } else {
        // _process.postValue(Resource.Error(getString(R.string.err_wrong_serial)))
        DialogService.showErrorBotToast("SERIAL không đúng");
      }
    }
  }

  Future<void> process(APick pick, int quantity, String? serial) async {
    final location = PickingLocation(
        pickListId: orPicking.id!,
        pickSessionId: _getPath.sessionId(),
        binLocationId: pick.binId,
        pickUpLocationId: pick.transport.id!);

    final product = PickingProduct(
        productId: pick.product.productBarcodeId,
        sku: pick.product.barcode,
        quantity: quantity,
        typeLabel: pick.product.isAttribute() ? "Nhãn lưu trữ" : "Serial",
        unitId: 0,
        serial: serial);

    final PickProcessResponse? response =
        await _processPicking.execute(location, product);
    if (response == null) {
      DialogService.showErrorBotToast("Có lỗi xảy ra");
      return;
    }

    skuAwaitSerial = null;

    if (serial == null) {
      _pickController.takeSku(quantity);
    } else {
      _pickController.takeSerial(serial);
    }

    count += quantity;

    final last = LastPicked(
        total: count,
        need: _pickController.remaining(),
        bin: pick.bin,
        transport: pick.transport,
        product: product);

    if (response.isAlternated()) {
      alternate(response, last);
      return;
    }

    // at current BIN still have product to process
    if (_pickController.shouldMoveNext()) {
      // pick for another product at current BIN
      final next = _pickController.next();
      if (next == null) {
        if (requestingChangePath) {
          requestingChangePath = false;
          //  _process.postValue(Resource.Success(PathChanging(last = last)))
          return;
        }
        // all of products at current BIN was processed, move to next BIN
        if (_getPath.hasNext()) {
          final nextBin = _getPath.next();
          _pickController.createNewPhase(nextBin);

          // _process.postValue(Resource.Success(Bin(nextBin.firstOrNull()?.bin ?: "n/a", last)))
        } else {
          // travels to all BIN -> done
          allDone = true;
          //_process.postValue(Resource.Success(AllDone(last = last)))
        }
      } else {
        // process next product, give info about last picked product
        //   _process.postValue(Resource.Success(Next(next, last)))
      }
    } else {
      // keep processing current SKU (same order), give info about last picked product
      //   _process.postValue(Resource.Success(last))
    }
  }

  Future<void> alternate(PickProcessResponse response, LastPicked? last) async {
    if (response.isFinished) {
      if (last != null) {
        //_process.postValue(Resource.Success(last))
        //  delay(2100) // sync with last put-in location pop up
      }

      //  _process.postValue(Resource.Success(Cancelled(response.message ?: "n/a")))
      return;
    }

    if (response.isReload) {
      final result = await _getPath.execute(orPicking.id!);
      orPicking = result!;

      count = _getPath.outCount;

      if (_getPath.hasNext()) {
        final next = _getPath.next();
        _pickController.createNewPhase(next);
        // _process.postValue(Resource.Success(Bin(next.firstOrNull()?.bin ?: "n/a")))
      } else {
        allDone = true;
        //_process.postValue(Resource.Success(AllDone(last = last)))
      }

      // delay(100);

      if (last != null) {
        //   _process.postValue(Resource.Success(last))
        // delay(2100) // sync with last put-in location pop up
      }

      //  _process.postValue(Resource.Success(PartiallyCancelled(orPicking.productCount, count, response.message ?: "n/a")))
    }
  }
}
