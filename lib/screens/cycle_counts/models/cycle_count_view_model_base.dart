import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/logics/cycle_count_logic/finish_count_logic.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/cycle_counts/models/new_count.dart';
import 'package:warehouse_app/screens/cycle_counts/models/started.dart';
import 'package:warehouse_app/screens/cycle_counts/views/lot_date_view.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import '../../../models/cycle_count_constain.dart';
import '../helpers/cycle_count_helper.dart';

abstract class CycleCountViewModelBase extends ViewModelBase {
  final startCountUseCase = StartCountLogic();
  final partnerUseCase = PartnerCycleCountLogic();
  final getSessionCountUseCase = GetSessionCountLogic();
  final processCountUseCase = ProcessCountLogic();
  final finishCountUseCase = FinishCountLogic();

  final helper = CycleCountHelper();

  late PartnerCycleCountView partnerView =
      PartnerCycleCountView(0, "", "", "", 0, 0, "", []);
  bool isVerify = false;
  CycleCountProduct? processingProduct;
  int lvSessionId = 0;
  Started? started;
  String codeScan = "";
  int qty = 1;

  CycleCountProduct product(int index) {
    return helper.original[index];
  }

  bool isSku(String code) {
    return processingProduct == null && helper.isBarcode(code);
  }

  Future<void> resume(int idSession) async {
    helper.isVerify = isVerify;
    lvSessionId = idSession;
    await refresh();
  }

  Future<void> refresh() async {
    setProcessing(true);
    helper.isVerify = isVerify;

    final details = await getSessionCountUseCase.execute(lvSessionId);
    if (details == null) {
      // TODO: look here
      setProcessing(false);
      return;
    }

    helper.process(details.details!);

    final pair = helper.twoList();
    final inWaiting = pair.key;
    final counting = pair.value;

    started = Started(details.locationCode, inWaiting, counting);
    setProcessing(false);
  }

  Future<void> finish() async {
    setProcessing(true);
    final resutl = await finishCountUseCase.execute(lvSessionId);
    if (!resutl) {
      // abc hhere
      setProcessing(false);
      return;
    }
    //     processState.postfinalue(Resource.Success(CycleCountState.Finish))
    setProcessing(false);
  }

  Future<void> process(
      {required CycleCountProduct product,
      String? code,
      required int quantity,
      bool isVerify = false}) async {
    int? expDate;
    int? manufactureDate;
    String? lotNumber;

    if (isVerify) {
      lotNumber = product.actualLotNumber2;

      if (product.actualExpiredDate2 != null &&
          product.actualManufactureDate2 != null) {
        expDate = product.actualExpiredDate2!.millisecond ~/ 1000;
        manufactureDate = product.actualManufactureDate2!.millisecond ~/ 1000;
      }
    } else {
      lotNumber = product.actualLotNumber1;

      if (product.actualExpiredDate1 != null &&
          product.actualManufactureDate1 != null) {
        expDate = product.actualExpiredDate1!.millisecond ~/ 1000;
        manufactureDate = product.actualManufactureDate1!.millisecond ~/ 1000;
      }
    }

    int? numOfExpiry;
    String? unitExpiry;

    if (product.numOfUnitExpiry == null) {
      if (product.numOfExpiry != null) {
        numOfExpiry = product.numOfExpiry;
        unitExpiry = product.unitExpiry;
        product.numOfUnitExpiry = "${product.numOfExpiry}${product.unitExpiry}";
      }
    }

    final checkedSerial = checkSerial(product);
    if (checkedSerial == null) {
      return;
    }

    processCountUseCase.execute(
        lvSessionId,
        CycleCountProcessPayload(
            productBarcodeId: product.productBarcodeId,
            storageCode: checkedSerial.isNotEmpty ? checkedSerial : null,
            qty: quantity,
            lotNumber: lotNumber,
            expiredDate: expDate,
            manufactureDate: manufactureDate,
            numOfExpiry: numOfExpiry,
            unitExpiry: unitExpiry));

    helper.newCount(product, code, quantity);

    notifyNewCount();
  }

  String? checkSerial(CycleCountProduct product) {
    if (product.isSerial() && product.isSerialCode(codeScan)) {
      if (helper.isSerialCounted(codeScan)) {
        DialogService.showErrorBotToast("Serial đã đếm");
        return null;
      }

      final found =
          product.storageCodes.any((it) => it.storageCode == codeScan);

      if (found) {
        return codeScan;
      }

      DialogService.showErrorBotToast("Không tìm thấy sản phẩm");
      return null;
    }

    return "";
  }

  bool isExpireManufactureDateNull(CycleCountProduct product) {
    if (helper.isVerify) {
      return product.actualExpiredDate2 == null;
    }

    return product.actualExpiredDate1 == null;
  }

  bool isLotNumberNull(CycleCountProduct product) {
    if (helper.isVerify) {
      return product.actualLotNumber2 == null;
    }

    return product.actualLotNumber1 == null;
  }

  void scanSkuCode(BuildContext context, String barcode, int quantity) {
    if (quantity > 0) {
      if (!isScanStorageCode(barcode)) {
        handleScanCodeIsNotStorageCode(context, barcode, quantity);
      }

      return;
    }

    DialogService.showErrorBotToast("Dữ liệu không hợp lệ");
  }

  bool isScanStorageCode(String barcode) {
    if (helper.isSerialCounted(barcode)) {
      DialogService.showErrorBotToast("Serial đã đếm");
      return false;
    }

    final processing = processingProduct;
    if (processing != null) {
      if (processing.storageCodes
          .any((product) => product.storageCode == barcode)) {
        //  foundProduct(processing, barcode, 1);
        processingProduct = null;
        return true;
      } else {
        DialogService.showErrorBotToast("Không tìm thấy sản phẩm");
        return false;
      }
    }
    return false;
  }

  void handleScanCodeIsNotStorageCode(
      BuildContext context, String barcode, int quantity) {
    final product = helper.check(barcode);
    if (product != null) {
      if (isProductHasExpireAndLotNumber(product,
          isSerial: !product.isSerial())) {
        showLotDateDialogState(context, product, quantity, barcode);
      } else {
        foundProduct(context, product, barcode, quantity);
      }

      return;
    }

    DialogService.showErrorBotToast("Không tìm thấy sản phẩm");
  }

  bool isProductHasExpireAndLotNumber(CycleCountProduct product,
      {bool isSerial = true}) {
    final isNeedDate =
        product.isExpiryDate! && isExpireManufactureDateNull(product);
    final isNeedLotNumber = product.isLotNumber! && isLotNumberNull(product);
    return (isNeedDate || isNeedLotNumber) && isSerial;
  }

  foundProduct(
      BuildContext context, CycleCountProduct p, String code, int qty) {
    if (p.isSerial()) {
      if (p.barcode == code) {
        processingProduct = p;
        //   processState.postfinalue(Resource.Success(CycleCountState.AwaitSerial))
        return;
      }

      if (p.isSerialCode(code)) {
        if (isProductHasExpireAndLotNumber(p)) {
          showLotDateDialogState(context, p, 1, code);
        } else {
          process(product: p, code: code, quantity: 1);
        }
      }
    } else {
      process(product: p, quantity: qty);
    }
  }

  @override
  Future<void> scan(BuildContext context, String barcode) {
    //  currentStateUI = CycleCount.COUNTING_STATE
    helper.isVerify = isVerify;
    final normalize = barcode.trim();
    final parts = normalize.split("|");
    final code = parts[0];
    final int? quantity = getQuantity(parts);
    if (quantity == null) {
      DialogService.showErrorBotToast("Dữ liệu không hợp lệ");
      return Future.value();
    }

    codeScan = code;
    qty = quantity;
    return Future.value();
  }

  void scanLocationCode(
      {required String barcode,
      int cycleCountId = 0,
      int roundNumber = CYCLE_COUNT,
      int cycleCountType = RANDOM}) async {
    final startSession = await startCountUseCase.execute(
        cycleCountId: cycleCountId,
        locationCode: barcode,
        roundNumber: roundNumber,
        cycleCountType: cycleCountType);

    if (startSession == null) {
      return;
    }

    final detailsDataSession =
        await getSessionCountUseCase.execute(startSession.countingSessionId!);
    lvSessionId = startSession.countingSessionId!;
    helper.process(detailsDataSession!.details!);
    final pair = helper.twoList();

    final inWaiting = pair.key;
    final counting = pair.value;

    started = Started(detailsDataSession.locationCode!, inWaiting, counting);
  }

  String getPartnerSku(String barcode) {
    return helper.findPartnerSkuByBarcode(barcode);
  }

  void clearState() {
    lvSessionId = 0;
  }

  showLotDateDialogState(BuildContext context, CycleCountProduct product,
      int quantity, String barcode) {
    DialogService.showBottomSheet(context,
        chid: LotDateView(
          product: product,
        ),
        title: "");
  }

  NewCount? newCount;
  void notifyNewCount() {
    final pair = helper.twoList();
    final inWaiting = pair.key;
    final counting = pair.value;

    newCount = NewCount(inWaiting, counting);
  }
}
