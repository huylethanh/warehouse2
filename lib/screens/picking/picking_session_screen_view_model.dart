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
import 'models/models.dart';

enum TASK { begin, registeredTransport, registerBin, finish }

class PickingSessionScreenViewModel extends ScanableViewModelBase {
  late ORPicking orPicking;

  final pickController = BinPickController();
  final _abortPickingSession = AbortPickingSession();
  final _finishPickingUp = FinishPickingUp();
  final _getPath = GetPath();
  final _checkTransportAvailable = CheckTransportAvailable();
  final registerPickingTransport = RegisterPickingTransport();
  final _getSingleOr = GetSingleOr();
  final _pickAllInBin = PickAllInBin();
  final _skipProduct = SkipProduct();
  final _processPicking = ProcessPicking();

  String? currentCode;
  int count = 0;

  bool gettingCargo = false;
  bool allDone = false;
  bool requestingChangePath = false;
  String? skuAwaitSerial;
  Bin? bin;

  TASK task = TASK.begin;

  LastPicked? last;

  PickingSessionScreenViewModel() : super();

  init(ORPicking orPicking) {
    this.orPicking = orPicking;
  }

  String getStepName() {
    switch (task) {
      case TASK.begin:
        return "Quét thiết bị chứa hàng";

      case TASK.registeredTransport:
        return "Quét vị trí lấy hàng";

      case TASK.registerBin:
        return "Quét sản phẩm";

      default:
        return "";
    }
  }

  bool showSkip() {
    return pickController.processing != null;
  }

  void doAction(BuildContext context, String barcode) {
    switch (task) {
      case TASK.begin:
        registerTransport(barcode);

        break;
      default:
        processInput(context, barcode);
        return;
    }
  }

  void cargoSelectedChanges(bool value) {
    gettingCargo = true;
    notifyListeners();
  }

  @override
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

    // if (bin != null) {
    //   if (!pickController.binVerified()) {
    //     if (pickController.checkBin(bin!.code)) {
    //       if (pickController.processing != null) {
    //         //_process.postValue(Resource.Success(Next(it)))

    //         //    pickedProduct = pickController.processing!;
    //         // do nothing  hrere will change the logic
    //       }
    //     } else {
    //       DialogService.showErrorBotToast("Vị trí lưu kho không đúng");
    //     }

    //     setProcessing(false);
    //     return;
    //   }
    // }

    // setProcessing(false);
    // DialogService.showErrorBotToast("Vị trí lưu kho không đúng");
    // return;

    //_enoughTransport = true;
    //notifyListeners();
  }

  bool canPickAllInBin() {
    return pickController.processing?.canPickAll == true;
  }

  String currentSku() {
    return pickController.processing?.product.barcode ?? "n/a";
  }

  Future<void> cancel() async {
    setProcessing(true);

    await _abortPickingSession.execute(orPicking.id!);

    task = TASK.begin;
// might need to go back the list view
    setProcessing(false);
  }

  Future<void> skip(BuildContext context) async {
    const title = "Bỏ qua";
    var message = "";

    if (task == TASK.registeredTransport) {
      message = "Bạn có chắc muốn bỏ qua sản phẩm ${currentSku()}?";
    } else {
      message = "Bạn có chắc muốn hủy phiên pick-up hiện tại?";
    }

    final confirmed = await DialogService.confirmDialog(context,
        title: title, message: message);
    if (confirmed) {
      if (task == TASK.registeredTransport) {
        _skip(context);
      } else {
        // cancel();
      }
    }
  }

  Future<void> finish(BuildContext context) async {
    setProcessing(true);

    await _finishPickingUp.execute(orPicking.id!, _getPath.sessionId());
    // might need to go back the list view

    task = TASK.finish;
    setProcessing(false);
    Navigator.pop(context);
  }

  Future<void> registerTransport(String barcode) async {
    String code = barcode.trim().toUpperCase();

    setProcessing(true);

    final checkTransport = await _checkTransportAvailable.simpleCheck(code);

    if (checkTransport) {
      final regTrasport = registerPickingTransport.register(code);

      if (regTrasport) {
        //registeredTrasport = checkTransport;

        if (registerPickingTransport.count() == orPicking.numOfTransport) {
          await registerPickingTransport.execute(orPicking.id!);

          await getPickingPath();
        }

        setProcessing(false);
        return;
      }
    }

    DialogService.showErrorBotToast("Thiết bị chứa hàng $code không khả dụng");
    setProcessing(false);
  }

  // Future<void> regTransports(bool orChanged) async {
  //   task = TASK.REG_TRANSPORTS;

  //   setProcessing(true);

  //   if (orChanged) {
  //     final data = await _getSingleOr.execute(orPicking.id!);
  //     if (data != null) {
  //       orPicking = data;
  //     }
  //   } else {
  //     registerPickingTransport.execute(orPicking.id!);
  //   }

  //   setProcessing(false);
  // }

  void removeTransport(String code) {
    setProcessing(true);

    final removed = registerPickingTransport.removeByName(code);
    if (removed) {
      if (registerPickingTransport.count() == orPicking.numOfTransport) {
        registerPickingTransport.execute(orPicking.id!);
        //_enoughTransport.postValue(true)
      }
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

      task = TASK.registeredTransport;
    }

    setProcessing(false);
  }

  Future<void> start() async {
    if (_getPath.hasNext()) {
      final next = _getPath.next();
      pickController.createNewPhase(next);

      bin = Bin(next.firstOrDefault(defaultValue: null)?.bin ?? "N/A", null);
    } else {
      allDone = true;
    }
  }

  Future<void> pickAllInBin(BuildContext context) async {
    setProcessing(true);

    if (pickController.processing == null) {
      return;
    }

    APick processing = pickController.processing!;

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
      alternate(context, response, null);
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

    last = LastPicked(
        total: count,
        need: 0,
        bin: processing.bin,
        transport: processing.transport,
        product: product);

    if (_getPath.hasNext()) {
      final nextBin = _getPath.next();
      pickController.createNewPhase(nextBin);

      //    _process.postValue(Resource.Success(Bin(nextBin.firstOrNull()?.bin ?: "n/a", last)))
    } else {
      await DialogService.confirmDialog(context,
          title: "Thay đổi",
          message: "Sản phẩm cuối cùng đã được lấy, kết thúc công việc.",
          oneOption: true,
          noLabel: "OK");

      await finish(context);
    }

    setProcessing(false);
  }

  Future<void> _skip(BuildContext context) async {
    final removing = pickController.processing;

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

    setProcessing(true);

    final newPath = await _skipProduct.execute(
        orPicking.id!, _getPath.sessionId(), location, product);

    if (newPath == null) {
      // DialogService.showErrorBotToast("Đã có lỗi");
      setProcessing(false);
      return;
    }

    orPicking = await _getPath.execute2(newPath);
    count = _getPath.outCount;

    if (_getPath.hasNext()) {
      final next = _getPath.next();
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
      setProcessing(false);
      // _process.postValue(Resource.Success(AllDone(last = null)))
    }
  }

  @override
  Future<void> scan(BuildContext context, String barcode) async {
    if (allDone) {
      return;
    }

    final normalize = barcode.trim();

    final parts = normalize.split("|");

    final code = parts[0];

    final quantityString = parts.getOrElse<String>(1, (index) {
      return "1";
    });

    final quantity = int.tryParse(quantityString);

    if (quantity == null) {
      DialogService.showErrorBotToast("Dữ liệu không đúng");
      return;
    }

    if (!pickController.binVerified()) {
      if (pickController.processing != null && pickController.checkBin(code)) {
        task = TASK.registerBin;
        //_process.postValue(Resource.Success(Next(it)))

        //    pickedProduct = pickController.processing!;
        // do nothing  hrere will change the logic
      } else {
        DialogService.showErrorBotToast("Vị trí lưu kho không đúng");
      }

      notifyListeners();
      return;
    }

    if (skuAwaitSerial == null) {
      if (code.toUpperCase() == pickController.processingBin!.toUpperCase()) {
        if (canPickAllInBin()) {
          final confirmed = await DialogService.confirmDialog(context,
              title: "Lấy toàn bộ"
                  "Bạn có muốn lấy toàn bộ sản phẩm tại vị trí lấy hàng $code");

          if (confirmed) {
            pickAllInBin(context);
          }
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
          process(context, pickController.processing!, quantity, code);
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
              process(context, pickController.processing!, quantity,
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
          process(context, pickController.processing!, 1, code);
        }
      } else {
        // _process.postValue(Resource.Error(getString(R.string.err_wrong_serial)))
        DialogService.showErrorBotToast("SERIAL không đúng");
      }
    }
  }

  Future<void> process(
      BuildContext context, APick pick, int quantity, String? serial) async {
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

    setProcessing(true);
    final PickProcessResponse? response =
        await _processPicking.execute(location, product);
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

    last = LastPicked(
        total: count,
        need: pickController.remaining(),
        bin: pick.bin,
        transport: pick.transport,
        product: product);

    if (response.isAlternated()) {
      alternate(context, response, last);
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
        if (_getPath.hasNext()) {
          final nextBin = _getPath.next();
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
        //pickedProduct = pickController.processing!;

        setProcessing(false);
      }
    } else {
      // keep processing current SKU (same order), give info about last picked product
      //   _process.postValue(Resource.Success(last))

      final transport = last!.transport!;
      DialogService.showSuccessBotToast(
          "Vị trí sản phẩm vừa lấy: ${transport.index} - ${transport.code}",
          duration: const Duration(seconds: 1));

      setProcessing(false);
    }
  }

  Future<void> alternate(BuildContext context, PickProcessResponse response,
      LastPicked? last) async {
    if (response.isFinished) {
      await DialogService.confirmDialog(context,
          title: "Thay đổi",
          message: response.message,
          oneOption: true,
          noLabel: "Đóng");

      await finish(context);

      return;
    }

    if (response.isReload) {
      final result = await _getPath.execute(orPicking.id!);
      orPicking = result!;

      count = _getPath.outCount;

      if (_getPath.hasNext()) {
        final next = _getPath.next();
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
