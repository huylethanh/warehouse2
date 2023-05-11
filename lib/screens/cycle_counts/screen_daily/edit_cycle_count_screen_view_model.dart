// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/cycle_counts/models/enum.dart';
import 'package:warehouse_app/screens/views/views.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import '../models/cycle_count_view_model_base.dart';

class EditProductCycleCount {
  final int sessionId;
  final CycleCountProduct product;
  final String locationCode;
  final CycleCountType type;
  final bool isVerify;

  EditProductCycleCount(
      {required this.sessionId,
      required this.product,
      required this.locationCode,
      required this.type,
      this.isVerify = false});
}

class EditCycleCountScreenViewModel extends ScanableViewModelBase {
  final removeCountUseCase = RemoveCountLogic();
  final processCountUseCase = ProcessCountLogic();

  final List<String> serials = [];
  final List<String> originalSerials = [];
  late bool isVerify;

  int mSessionId = 0;
  CycleCountProduct? mProduct;

  int updateQuantity = 0;
  int originalQuantity = 0;
  String codeScan = "";
  bool isAwaitingSerial = false;

  EditCycleCountScreenViewModel(EditProductCycleCount productCycleCount)
      : super() {
    isVerify = productCycleCount.isVerify;
  }

  int qty() {
    return originalQuantity + updateQuantity;
  }

  progressVerify(int sessionId, CycleCountProduct p) {
    mSessionId = sessionId;
    mProduct = p;
    originalSerials.addAll(p.additionSerials.reversed);
    for (var it in p.storageCodes) {
      if (it.isCounted() && !isNullOrEmpty(it.storageCode)) {
        originalSerials.add(it.storageCode!);
      }
    }

    originalQuantity = p.actualQty2 + p.modifiedQty2;

    serials.addAll(originalSerials);
  }

  process(int sessionId, CycleCountProduct p) {
    mSessionId = sessionId;
    mProduct = p;
    originalSerials.addAll(p.additionSerials.reversed);
    for (var it in p.storageCodes) {
      if (it.isCounted() && !isNullOrEmpty(it.storageCode)) {
        originalSerials.add(it.storageCode!);
      }
    }
    originalQuantity = p.actualQty1 + p.modifiedQty1;

    serials.addAll(originalSerials);
  }

  String? checkSerial(String? code, CycleCountProduct product) {
    if (product.isSerial() && product.isSerialCode(codeScan)) {
      final found = product.storageCodes.any((it) => it.storageCode == code);

      if (found) {
        return code;
      } else {
        DialogService.showErrorBotToast("Không tìm thấy sản phẩm");
      }
    }

    return null;
  }

  @override
  Future<void> scan(BuildContext context, String barcode) async {
    final normalize = barcode.trim();
    final parts = normalize.split("|");
    final code = parts[0];
    final int? quantity = getQuantity(parts);
    if (quantity == null) {
      DialogService.showErrorBotToast("Dữ liệu không hợp lệ");
      return;
    }

    if (serials.contains(barcode)) {
      DialogService.showErrorBotToast("Serial đã đếm");
      return;
    }

    final product = mProduct!;
    if (isVerify) {
      if (((product.isExpiryDate && product.actualExpiredDate2 == null) ||
              (product.isLotNumber && product.actualLotNumber2 == null)) &&
          !product.isSerial()) {
        await showLotDateDialogState(context, product, quantity, barcode);
        return;
      }
    } else {
      if (((product.isExpiryDate && product.actualExpiredDate1 == null) ||
              (product.isLotNumber && product.actualLotNumber1 == null)) &&
          !product.isSerial()) {
        await showLotDateDialogState(context, product, quantity, barcode);
        return;
      }
    }

    if (product.isSerial()) {
      if (product.isSerialCode(code)) {
        isAwaitingSerial = false;
        if (isVerify) {
          if ((product.isExpiryDate && product.actualExpiredDate2 == null) ||
              (product.isLotNumber && product.actualLotNumber2 == null)) {
            await showLotDateDialogState(context, product, quantity, barcode);
            return;
          } else {
            await _process(product, code, 1, isVerify);

            //_state.postValue(Success(SerialAdded(code)))
            serials.add(code);
          }
        } else {
          if ((product.isExpiryDate && product.actualExpiredDate1 == null) ||
              (product.isLotNumber && product.actualLotNumber1 == null)) {
            await showLotDateDialogState(context, product, quantity, barcode);
            return;
          } else {
            await _process(product, code, 1, isVerify);

            //  _state.postValue(Success(SerialAdded(code)))
            serials.add(code);
          }
        }
      } else if (!isAwaitingSerial && product.barcode == code) {
        isAwaitingSerial = true;
        //   _state.postValue(Success(AwaitSerial))
      } else {
        DialogService.showErrorBotToast("Mã không tồn tại");
        return;
      }
    } else if (product.barcode == code) {
      _process(product, code, quantity, isVerify);
    } else {
      DialogService.showErrorBotToast("Mã không tồn tại");
      return;
    }
  }

  _process(CycleCountProduct product, String? code, int quantity,
      bool isVerify) async {
    int? expDate;
    int? manufactureDate;
    String? lotNumber;

    if (isVerify) {
      lotNumber = product.actualLotNumber2;

      if (product.actualExpiredDate2 != null &&
          product.actualManufactureDate2 != null) {
        expDate = product.actualExpiredDate2!.millisecondsSinceEpoch ~/ 1000;
        manufactureDate =
            product.actualManufactureDate2!.millisecondsSinceEpoch ~/ 1000;
      }
    } else {
      lotNumber = product.actualLotNumber1;

      if (product.actualExpiredDate1 != null &&
          product.actualManufactureDate1 != null) {
        expDate = product.actualExpiredDate1!.millisecondsSinceEpoch ~/ 1000;
        manufactureDate =
            product.actualManufactureDate1!.millisecondsSinceEpoch ~/ 1000;
      }
    }

    mProduct = product;

    int? numOfExpiry;

    String? unitExpiry;

    if (product.numOfUnitExpiry == null) {
      if (product.numOfExpiry != null) {
        numOfExpiry = product.numOfExpiry;
        unitExpiry = product.unitExpiry;
        product.numOfUnitExpiry = "${product.numOfExpiry}${product.unitExpiry}";
      }
    }

    final result = await processCountUseCase.execute(
        mSessionId,
        CycleCountProcessPayload(
            productBarcodeId: product.productBarcodeId,
            storageCode: checkSerial(code, product),
            qty: quantity,
            lotNumber: lotNumber,
            expiredDate: expDate,
            manufactureDate: manufactureDate,
            numOfExpiry: numOfExpiry,
            unitExpiry: unitExpiry));

    if (!result) {
      return;
    }
    //_state.postValue(Success(OnUpdate))
    updateQuantity += quantity;
  }

  Future<void> showLotDateDialogState(BuildContext context,
      CycleCountProduct product, int quantity, String barcode) async {
    final value = await DialogService.showBottomSheet<DurationValue>(
      context,
      chid: AskForDurationScreen(
        product: ProductInfo(
            productName: product.productName,
            avatarURL: product.avatarURL,
            code: product.barcode ?? ""),
        needDuration: product.isExpiryDate,
        needLotNumber: product.isLotNumber,
        durationValue: DurationValue(
          lotNumber: product.systemLotNumber1,
          expireDate: product.systemExpiredDate1 ?? DateTime.now(),
          issueDate: product.systemManufactureDate1 ?? DateTime.now(),
        ),
      ),
      title: "",
    );

    if (value == null) {
      return;
    }

    product = product.copyWith(
      numOfExpiry: value.numOfExpiry,
      unitExpiry: value.unitExpiry,
      actualExpiredDate1: value.expireDate,
      actualManufactureDate1: value.issueDate,
      actualLotNumber1: value.lotNumber,
    );

    setProcessing(true);

    await _process(product, barcode, quantity, isVerify);

    setProcessing(false);
  }

  Future<void> deleteSerial(int index) async {
    setProcessing(true);

    final product = mProduct;
    if (product == null) {
      DialogService.showErrorBotToast("Serial đã đếm");
      setProcessing(false);
      return;
    }

    removeCountUseCase.execute(
        mSessionId,
        CycleCountRemovePayload(
            productBarcodeId: product.productBarcodeId,
            storageCodes: [serials[index]]));
    serials.removeAt(index);
    setProcessing(false);
    //     _state.postValue(Success(SerialRemoved(index)))
  }

  Future<void> reset(BuildContext context) async {
    final confirmed = await DialogService.confirmDialog(context,
        title: "Đếm lại", message: "Bạn có muốn đếm lại sản phẩm này?");

    if (!confirmed) {
      return;
    }

    final product = mProduct;

    if (product == null) {
      DialogService.showErrorBotToast("Dữ liệu không hợp lệ");
      return Future.value();
    }

    setProcessing(true);

    if (product.isSerial()) {
      removeCountUseCase.execute(
          mSessionId,
          CycleCountRemovePayload(
              productBarcodeId: product.productBarcodeId,
              storageCodes: serials));
    } else {
      await removeCountUseCase.execute(
          mSessionId,
          CycleCountRemovePayload(
              productBarcodeId: product.productBarcodeId, storageCodes: []));
    }

    setProcessing(false);
    Navigator.pop(context, true);

    //_state.postValue(Success(OnReset))
  }
}
