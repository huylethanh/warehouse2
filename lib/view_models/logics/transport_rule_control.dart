import 'package:darq/darq.dart';
import '../logics/logic_models/logic_models.dart';
import 'logic_models/put_away_list.dart';

class TransportRuleControl {
  String? processingSku = null;

  final List<InboundProduct> remainingList = [];
  final List<InboundProduct> processedList = [];
  final putAwayList = PutAwayList();

  clear() {
    processingSku = null;
    processedList.clear();
    remainingList.clear();
    putAwayList.clear();
  }

  InboundProduct getAt(int index) {
    return remainingList[index];
  }

  List<CheckListItem> perceive(List<InboundProduct> data) {
    remainingList.addAll(data);
    return putAwayList.init(remainingList);
  }

  int query(String code) {
    return remainingList.indexWhere((it) {
      final uper = it.sku!.toUpperCase();
      return uper == code.toUpperCase() || it.serial == code;
    });
  }

  int find(String serial) {
    return remainingList.indexWhere((it) {
      final uper = it.sku!.toUpperCase();
      return uper == processingSku?.toUpperCase() || it.serial == serial;
    });
  }

  bool isSku(String code) {
    final p = remainingList.firstWhereOrDefault((e) {
      final uper = e.sku!.toUpperCase();
      return uper == code.toUpperCase();
    });

    return p != null && p.serial == null;
  }

  int processingEqc(int productId, String? lotNo, String? expireDate) {
    expireDate = expireDate ?? "qq";

    return remainingList.indexWhere((it) {
      return it.id == productId &&
          it.lotNo == lotNo &&
          (it.expireDate == expireDate ||
              it.expireDate?.contains(expireDate!) == true);
    });
  }

  saveProcessingSku(String sku) {
    processingSku = sku;
  }

  bool hasProcessingSku() {
    return processingSku != null;
  }

  void cleanProcessing() {
    processingSku = null;
  }

  List<CheckListItem> update(int processedIndex, int quantity) {
    processingSku = null;
    final check = remainingList[processedIndex];
    final remaining = check.quantity! - (check.out + quantity);

    check.out = check.out + quantity;
    if (remaining == 0) {
      final product = remainingList.removeAt(processedIndex);
      processedList.add(product);
    }
    return putAwayList.remove(check, quantity);
  }

  bool hasDone() {
    return remainingList.isEmpty;
  }

  int count() {
    return processedList.length;
  }

  int remaining() {
    return remainingList.length;
  }
}
