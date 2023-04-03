// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/views/views.dart';
import 'package:warehouse_app/utils/colection.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'helpers/bin_pick_controller.dart';
import 'models/A_pick.dart';

enum TASK { REG_SINGLE_TRANSPORT, REG_TRANSPORTS, GET_PATH, PROCESS }

class PickingSessionScreenViewModel extends ViewModelBase {
  late ORPicking orPicking;

  final pickController = BinPickController();
  final abortPickingSession = AbortPickingSession();
  final finishPickingUp = FinishPickingUp();
  final getPath = GetPath();
  final checkTransportAvailable = CheckTransportAvailable();
  final registerPickingTransport = RegisterPickingTransport();
  final getSingleOr = GetSingleOr();
  final _pickAllInBin = PickAllInBin();
  final skipProduct = SkipProduct();
  final processPicking = ProcessPicking();

  bool gettingCargo = false;
  bool _enoughTransport = false;
  int count = 0;
  bool allDone = false;

  TASK task = TASK.REG_SINGLE_TRANSPORT;

  PickingSessionScreenViewModel(this.orPicking);

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
    if (pickController.processing == null) {
      return false;
    }

    final p = pickController.processing;
    return p!.checkSku(code) && !p.isSerial();
  }

  void set(ORPicking or) {
    orPicking = or;
  }

  resume(PickUpTask task) {
    orPicking = ORPicking(
        id: task.id,
        code: "",
        orderCount: 0,
        productCount: 0,
        sizeName: null,
        createdDate: null,
        numOfTransport: 0,
        priority: 0);

    _enoughTransport = true;
  }

  bool canPickAllInBin() {
    return pickController.processing?.canPickAll == true;
  }

  String currentSku() {
    return pickController.processing?.product.barcode ?? "n/a";
  }

  Future<void> cancel() async {
    task = TASK.REG_SINGLE_TRANSPORT;
    setProcessing(true);

    await abortPickingSession.execute(orPicking.id!);

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

    await finishPickingUp.execute(orPicking.id!, getPath.sessionId());
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

    final checkTransport = await checkTransportAvailable.simpleCheck(code);
    final regTrasport = registerPickingTransport.register(code);

    if (checkTransport && regTrasport) {
      //  _registerTransport.postValue(Resource.Success(SingleAdded(code)))

      if (registerPickingTransport.count() == orPicking.numOfTransport) {
        setProcessing(true);

        task = TASK.REG_TRANSPORTS;
        await registerPickingTransport.execute(orPicking.id!);

        await getPickingPath();
        setProcessing(false);
      }
    } else {
      DialogService.showErrorBotToast(
          "Thiết bị chứa hàng $code không khả dụng");
    }
  }

  Future<void> regTransports(bool orChanged) async {
    task = TASK.REG_TRANSPORTS;

    setProcessing(true);

    if (orChanged) {
      final data = await getSingleOr.execute(orPicking.id!);
      if (data != null) {
        orPicking = data;
      }
    } else {
      registerPickingTransport.execute(orPicking.id!);
    }

    setProcessing(false);
  }

  Future<void> getPickingPath() async {
    task = TASK.GET_PATH;

    setProcessing(true);
    final data = await getPath.execute(orPicking.id!);
    if (data != null) {
      orPicking = data;

      count = getPath.outCount;

      await start();
    }

    setProcessing(false);
  }

  Future<void> start() async {
    task = TASK.GET_PATH;

    setProcessing(true);

    if (getPath.hasNext()) {
      final next = getPath.next();
      pickController.createNewPhase(next);

      //final bin = Bin(next.firstOrNull()?.bin ?: "n/a")
    } else {
      allDone = true;
    }

    setProcessing(true);
  }

  Future<void> pickAllInBin() async {
    setProcessing(true);

    task = TASK.PROCESS;

    //return Future.value();

    if (pickController.processing == null) {
      return;
    }

    APick processing = pickController.processing!;

    final location = PickingLocation(
        pickListId: orPicking.id!,
        pickSessionId: getPath.sessionId(),
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

    final quantity = pickController.count();
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

    if (getPath.hasNext()) {
      final nextBin = getPath.next();
      pickController.createNewPhase(nextBin);

      //    _process.postValue(Resource.Success(Bin(nextBin.firstOrNull()?.bin ?: "n/a", last)))
    } else {
      // travels to all BIN -> done
      allDone = true;
      //  _process.postValue(Resource.Success(AllDone(last = last)))
    }
  }

  Future<void> skip() async {
    task = TASK.PROCESS;

    final removing = pickController.processing;

    if (removing == null) {
      DialogService.showErrorBotToast("Đã có lỗi");
      return;
    }

    final location = PickingLocation(
        pickListId: orPicking.id!,
        pickSessionId: getPath.sessionId(),
        binLocationId: removing.binId,
        pickUpLocationId: removing.transport.id!);

    final product = PickingProduct(
        productId: removing.product.productBarcodeId,
        sku: removing.product.barcode,
        quantity: removing.remaining(),
        typeLabel: removing.product.isAttribute() ? "Nhãn lưu trữ" : "Serial",
        unitId: removing.product.unitId,
        serial: null);

    final newPath = await skipProduct.execute(
        orPicking.id!, getPath.sessionId(), location, product);

    if (newPath == null) {
      DialogService.showErrorBotToast("Đã có lỗi");
      return;
    }

    orPicking = await getPath.execute2(newPath);
    count = getPath.outCount;

    if (getPath.hasNext()) {
      final next = getPath.next();
      pickController.createNewPhase(next);

      if (pickController.checkBin(removing.bin)) {
        if (pickController.processing != null) {
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

  String? skuAwaitSerial;
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

    if (!pickController.binVerified()) {
      if (pickController.checkBin(code)) {
        if (pickController.processing != null) {
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
      if (code.toUpperCase() == pickController.processingBin!.toUpperCase()) {
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

      if (quantity > 1 && pickController.isSerial()) {
        DialogService.showErrorBotToast(
            "Sản phẩm là serial không được lấy quá 1");
        return;
      }

      if (pickController.overQuantity(quantity)) {
        DialogService.showErrorBotToast("Số lượng vượt quá số lượng cần lấy");
        return;
      }

      if (pickController.containsStorageCode(code)) {
        if (pickController.processing != null) {
          process(pickController.processing!, quantity, code);
        }

        return;
      }

      final isSku = pickController.checkSku(code);
      final maybeSerial =
          pickController.isSerial() && pickController.notSkuInBin(code);
      if (isSku || maybeSerial) {
        if (isSku && pickController.isSerial()) {
          skuAwaitSerial = code;
          //     _process.postValue(Resource.Success(AwaitSerial))
        } else {
          if (pickController.emptyStorageCode()) {
            if (pickController.processing != null) {
              process(pickController.processing!, quantity,
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
      if (pickController.notSkuInBin(code) &&
          (pickController.emptyStorageCode() ||
              pickController.containsStorageCode(code))) {
        if (pickController.processing != null) {
          process(pickController.processing!, 1, code);
        }
      } else {
        // _process.postValue(Resource.Error(getString(R.string.err_wrong_serial)))
        DialogService.showErrorBotToast("SERIAL không đúng");
      }
    }
  }

  bool requestingChangePath = false;

  Future<void> process(APick pick, int quantity, String? serial) async {
    final location = PickingLocation(
        pickListId: orPicking.id!,
        pickSessionId: getPath.sessionId(),
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
        await processPicking.execute(location, product);
    if (response == null) {
      DialogService.showErrorBotToast("Có lỗi xảy ra");
      return;
    }

    skuAwaitSerial = null;

    if (serial == null) {
      pickController.takeSku(quantity);
    } else {
      pickController.takeSerial(serial);
    }

    count += quantity;

    final last = LastPicked(
        total: count,
        need: pickController.remaining(),
        bin: pick.bin,
        transport: pick.transport,
        product: product);

    if (response.isAlternated()) {
      alternate(response, last);
      return;
    }

    // at current BIN still have product to process
    if (pickController.shouldMoveNext()) {
      // pick for another product at current BIN
      final next = pickController.next();
      if (next == null) {
        if (requestingChangePath) {
          requestingChangePath = false;
          //  _process.postValue(Resource.Success(PathChanging(last = last)))
          return;
        }
        // all of products at current BIN was processed, move to next BIN
        if (getPath.hasNext()) {
          final nextBin = getPath.next();
          pickController.createNewPhase(nextBin);

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
      final result = await getPath.execute(orPicking.id!);
      orPicking = result!;

      count = getPath.outCount;

      if (getPath.hasNext()) {
        final next = getPath.next();
        pickController.createNewPhase(next);
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
