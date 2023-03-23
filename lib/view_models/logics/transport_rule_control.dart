import 'package:darq/darq.dart';

import '../models/check_list_item.dart';
import '../models/inbound_product.dart';
import '../models/put_away_list.dart';

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
}
