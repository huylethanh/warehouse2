// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/view_model_base.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/screens/views/quantity_input/quantity_input.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import '../../models/models.dart';
import '../picking/helpers/helpers.dart';
import '../picking/models/models.dart';

class RepickScreenViewModel extends ViewModelBase {
  final pickController = BinPickController();
  final registerPickingTransport = RegisterRepickingTransport();
  final _getPath = GetRepickPath();
  final _processPicking = ProcessRepick();
  final _pickAllInBin = RepickAllInBin();
  final _skipProduct = SkipRepickProduct();
  final _finishPickingUp = FinishRepick();

  late ORPicking orPicking;

  int count = 0;
  bool allDone = false;
  Bin? bin;
  LastPicked? last;
  bool requestingChangePath = false;

  bool canPickAllInBin() {
    return pickController.processing?.canPickAll == true;
  }

  String currentSku() {
    return pickController.processing?.product.barcode ?? "n/a";
  }

  void cargoSelectedChanges(bool value) {
    gettingCargo = true;
    notifyListeners();
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
  }

  Future<void> getPickingPath() async {
    setProcessing(true);
    final data = await _getPath.execute(orPicking.id!);
    if (data != null) {
      orPicking = data;

      count = _getPath.outCount;

      await start();
    }

    setProcessing(false);
  }

  Future<void> start() async {
    if (_getPath.hasNext()) {
      final next = _getPath.next();
      pickController.createNewPhase(next);

      /// need to check step here. scan bin
      return;
    } else {
      allDone = true;
    }
  }

  String? skuAwaitSerial;

  bool gettingCargo = false;

  Future<void> processInput(BuildContext context, String barcode) async {
    barcode = barcode.trim();

    if (gettingCargo && !barcode.contains("|") && isSku(barcode)) {
      _inputQuantityDialog(context, barcode.trim());
    } else {
      await scan(context, barcode);
    }

    return;
  }

  bool isSku(String code) {
    if (pickController.processing == null) {
      return false;
    }

    final p = pickController.processing;
    return p!.checkSku(code) && !p.isSerial();
  }

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
      if (pickController.checkBin(code)) {
        if (pickController.processing != null) {
          //_process.postValue(Resource.Success(Next(it)))

          //    pickedProduct = pickController.processing!;
          // do nothing  hrere will change the logic
        }
      } else {
        DialogService.showErrorBotToast("Vị trí lưu kho không đúng");
      }

      notifyListeners();
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

  Future<void> finish(BuildContext context) async {
    setProcessing(true);

    await _finishPickingUp.execute(orPicking.id!, _getPath.sessionId());
    // might need to go back the list view

    setProcessing(false);
    Navigator.pop(context);
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
}
