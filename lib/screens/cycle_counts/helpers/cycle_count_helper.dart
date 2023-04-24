import 'package:darq/darq.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/models/models.dart';

import '../models/direct_serial.dart';

class CycleCountHelper {
  final List<CycleCountProduct> original = [];

  bool isVerify = false;

  final List<DirectSerial> directSerials = [];
  final List<String> countedSerial = [];

  final List<String> nonSerialBarcodes = [];

  final List<CycleCountItem> inWaiting = [];
  final List<CycleCountItem> counting = [];

  bool gotData = false;

  Future<void> process(List<CycleCountProduct> products) async {
    original.clear();
    original.addAll(products);

    nonSerialBarcodes.clear();
    directSerials.clear();
    countedSerial.clear();
    inWaiting.clear();
    counting.clear();

    int index = 0;
    for (final product in products) {
      product.initList();

      for (var serial in product.storageCodes) {
        if (!serial.isCounted()) {
          directSerials
              .add(DirectSerial(serial: serial.storageCode, baseIndex: index));
        } else {
          countedSerial.add(serial.storageCode!);
        }
      }

      index++;

      final isCounted =
          isVerify ? product.isCountedTwoTimes() : product.isCounted();

      if (isCounted) {
        counting.add(CycleCountItem(
            id: product.productBarcodeId,
            image: product.avatarURL ?? "",
            name: product.productName,
            barcode: product.barcode,
            quantity1: product.actualQty1,
            quantity2: product.actualQty2,
            isSerial: product.isSerial(),
            dataIndex: index,
            isExpiryDate: product.isExpiryDate!,
            isLotNumber: product.isLotNumber!,
            systemQty1: product.systemQty1!,
            systemQty2: product.systemQty2!,
            systemExpiredDate1: product.systemExpiredDate1,
            systemExpiredDate2: product.systemExpiredDate2,
            systemLotNumber1: product.systemLotNumber1,
            systemLotNumber2: product.systemLotNumber2,
            systemManufactureDate1: product.systemManufactureDate1,
            systemManufactureDate2: product.systemManufactureDate2,
            actualLotNumber2: product.actualLotNumber2,
            actualLotNumber1: product.actualLotNumber1,
            actualExpiredDate1: product.actualExpiredDate1,
            actualExpiredDate2: product.actualExpiredDate2,
            actualManufactureDate1: product.actualManufactureDate1,
            actualManufactureDate2: product.actualManufactureDate2,
            hasDifferentQty1: product.hasDifferentQty1,
            hasDifferentQty2: product.hasDifferentQty2));
      } else {
        final actualQuantity1 = (!isVerify) ? 0 : product.actualQty1;
        final actualQuantity2 = (isVerify) ? 0 : product.actualQty2;

        inWaiting.add(CycleCountItem(
            id: product.productBarcodeId,
            image: product.avatarURL ?? "",
            name: product.productName,
            barcode: product.barcode,
            quantity1: actualQuantity1,
            quantity2: actualQuantity2,
            isExpiryDate: product.isExpiryDate!,
            isLotNumber: product.isLotNumber!,
            systemQty1: product.systemQty1 ?? 0,
            systemQty2: product.systemQty2 ?? 0,
            systemExpiredDate1: product.systemExpiredDate1,
            systemExpiredDate2: product.systemExpiredDate2,
            systemLotNumber1: product.systemLotNumber1,
            systemLotNumber2: product.systemLotNumber2,
            systemManufactureDate1: product.systemManufactureDate1,
            systemManufactureDate2: product.systemManufactureDate2,
            actualLotNumber2: product.actualLotNumber2,
            actualLotNumber1: product.actualLotNumber1,
            actualExpiredDate1: product.actualExpiredDate1,
            actualExpiredDate2: product.actualExpiredDate2,
            actualManufactureDate1: product.actualManufactureDate1,
            actualManufactureDate2: product.actualManufactureDate2,
            hasDifferentQty1: product.hasDifferentQty1,
            hasDifferentQty2: product.hasDifferentQty2,
            isSerial: false,
            dataIndex: index));
      }

      if (!product.isSerial()) nonSerialBarcodes.add(product.barcode!);
    }

    gotData = true;
  }

  CycleCountProduct? check(String code) {
    code = code.toUpperCase();
    final CycleCountProduct? product =
        original.firstWhereOrDefault((it) => it.barcode?.toUpperCase() == code);
    if (product == null) {
      final serial = directSerials
          .firstWhereOrDefault((it) => it.serial?.toUpperCase() == code);
      if (serial != null) {
        return original[serial.baseIndex!];
      }

      return null;
    }

    return product;
  }

  bool isSerialCounted(String code) {
    return countedSerial.contains(code);
  }

  bool isBarcode(String code) {
    code = code.toUpperCase();
    return nonSerialBarcodes.any((element) => element.toUpperCase() == code);
  }

  void newCount(CycleCountProduct p, String? serial, int qty) {
    if (serial != null) {
      serial = serial.toUpperCase();
      p.countSerial(serial);
      countedSerial.add(serial);

      final found = directSerials
          .firstWhereOrDefault((it) => it.serial?.toUpperCase() == serial);

      if (found != null) {
        found.isCounted = true;
      }
    }

    updateProductInOriginalWhenCount(p = p, qty = qty);

    final actualQuantity1 = (!isVerify) ? qty : p.actualQty1;
    final actualQuantity2 = (isVerify) ? qty : p.actualQty2;

    final f1 = inWaiting.indexWhere((it) => it.id == p.productBarcodeId);

    if (f1 != -1) {
      final obsolete = inWaiting.removeAt(f1);
      counting.insert(
          0,
          CycleCountItem(
              id: p.productBarcodeId,
              image: p.avatarURL ?? "",
              name: p.productName,
              barcode: p.barcode,
              quantity1: actualQuantity1,
              quantity2: actualQuantity2,
              isExpiryDate: p.isExpiryDate!,
              isLotNumber: p.isLotNumber!,
              systemQty1: p.systemQty1!,
              systemQty2: p.systemQty2!,
              systemExpiredDate1: p.systemExpiredDate1,
              systemExpiredDate2: p.systemExpiredDate2,
              systemLotNumber1: p.systemLotNumber1,
              systemLotNumber2: p.systemLotNumber2,
              systemManufactureDate1: p.systemManufactureDate1,
              systemManufactureDate2: p.systemManufactureDate2,
              actualLotNumber2: p.actualLotNumber2,
              actualLotNumber1: p.actualLotNumber1,
              actualExpiredDate1: p.actualExpiredDate1,
              actualExpiredDate2: p.actualExpiredDate2,
              actualManufactureDate1: p.actualManufactureDate1,
              actualManufactureDate2: p.actualManufactureDate2,
              hasDifferentQty1: p.hasDifferentQty1,
              hasDifferentQty2: p.hasDifferentQty2,
              isSerial: p.isSerial(),
              dataIndex: obsolete.dataIndex));
    } else {
      final f2 = counting.indexWhere((it) => it.id == p.productBarcodeId);

      final obsolete = counting.removeAt(f2);

      if (isVerify) {
        obsolete.quantity2 = p.actualQty2 + qty;
        counting.insert(0, obsolete);
      } else {
        obsolete.quantity1 = p.actualQty1 + qty;
        counting.insert(0, obsolete);
      }
    }
  }

  MapEntry<List<CycleCountItem>, List<CycleCountItem>> twoList() {
    return MapEntry(inWaiting, counting);
  }

  void updateProductInOriginalWhenCount(CycleCountProduct p, int qty) {
    final item =
        original.firstWhere((it) => it.productBarcodeId == p.productBarcodeId);
    final index = original.indexWhere(
        (element) => element.productBarcodeId == item.productBarcodeId);

    if (isVerify) {
      original[index] = original[index].copyWith(
          actualQty2: p.actualQty2 + qty,
          actualLotNumber2: p.actualLotNumber2,
          actualExpiredDate2: p.actualExpiredDate2,
          actualManufactureDate2: p.actualManufactureDate2);
    } else {
      original[index] = original[index].copyWith(
          actualQty1: p.actualQty1 + qty,
          actualLotNumber1: p.actualLotNumber1,
          actualExpiredDate1: p.actualExpiredDate1,
          actualManufactureDate1: p.actualManufactureDate1);
    }
  }

  String findPartnerSkuByBarcode(String barcode) {
    barcode = barcode.toUpperCase();

    final found = original
        .firstWhereOrDefault((it) => it.barcode?.toUpperCase() == barcode);

    if (found != null) {
      return found.partnerSku!;
    }

    return "N/A";
  }
}
