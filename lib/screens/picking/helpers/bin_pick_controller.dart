import '../models/A_pick.dart';

class BinPickController {
  final List<APick> path = [];
  final List<String> skus = [];
  APick? processing;
  String? processingBin;

  int count() {
    return path.fold(0, (total, node) {
          return total + node.remaining();
        }) +
        (processing?.remaining() ?? 0);
  }

  createNewPhase(List<APick> binPicks) {
    processingBin = null;
    skus.clear();
    path.clear();
    path.addAll(binPicks);

    for (final pick in binPicks) {
      final p = pick.product;
      // SKU_IGNORE_CASE
      /*if (!p.isAttribute()) */
      skus.add(p.barcode!.toLowerCase());
    }
    // move to first
    next();
  }

  APick? next() {
    processing = null;

    if (path.isNotEmpty) {
      processing = path.removeAt(0);
    }

    return processing;
  }

  APick? skip() {
    if (path.isNotEmpty) {
      return path.removeAt(0);
    }

    return null;
  }

  bool shouldMoveNext() {
    return processing?.remaining() == 0;
  }

  int remaining() {
    return processing?.remaining() ?? 0;
  }

  bool binVerified() {
    return processingBin != null;
  }

  bool checkBin(String code) {
    if (code.toUpperCase() == processing?.bin.toUpperCase()) {
      processingBin = processing?.bin;
      return processingBin != null;
    }
    return false;
  }

  bool checkSku(String? code) {
    return processing?.checkSku(code!) ?? false;
  }

  bool notSkuInBin(String code) {
//        return processing?.checkSerial(code) ?: false
    // SKU_IGNORE_CASE
    return !skus.contains(code.toLowerCase());
  }

  void takeSku(int quantity) {
    processing?.take(quantity);
  }

  void takeSerial(String code) {
    processing?.takeSerial(code);
  }

  bool isSerial() {
    return processing?.isSerial() ?? false;
  }

  bool overQuantity(int value) {
    return processing?.overQuantity(value) ?? true;
  }

  bool containsStorageCode(String code) {
    return processing?.containsStorageCode(code) ?? false;
  }

  bool emptyStorageCode() {
    return processing?.emptyStorageCode() ?? true;
  }
}
