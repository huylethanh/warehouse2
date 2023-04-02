import 'package:warehouse_app/models/models.dart';

class APick {
  final String bin;
  final int binId;
  final bool canPickAll;
  final PickingTransport transport;
  final PickProduct product;

  APick({
    required this.bin,
    required this.binId,
    required this.canPickAll,
    required this.transport,
    required this.product,
  });

  int count = 0;

  init() {
    count = product.quantity ?? 0;
  }

  bool isSerial() {
    return product.productType != ProductType.nonSerial;
  }

  bool overQuantity(int value) {
    return value > count;
  }

  bool checkSku(String? code) {
    return product.barcode?.toUpperCase() == code?.toUpperCase() &&
        product.productType != ProductType.cargo;
  }

  //TODO: this method is never used
  bool checkSerial(String code) {
    //        return serials.contains(code)
    return false;
  }

  void take(int quantity) {
    count -= quantity;
  }

  void takeSerial(String serial) {
    count -= 1;
  }

  bool isEmpty() {
    return count == 0;
  }

  int remaining() {
    return count;
  }

  bool containsStorageCode(String code) {
    return product.storageCodes.contains(code);
  }

  bool emptyStorageCode() {
    return product.storageCodes.isEmpty;
  }
}
