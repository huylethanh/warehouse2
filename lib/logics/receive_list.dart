import 'package:warehouse_app/models/models.dart';

import 'package:darq/darq.dart';

import 'logic_models/logic_models.dart';

class ReceivedList {
  // does it need to be clear when change transport?
  Map<String, ReceivedItem> data = {};

  List<CheckListItem> resume(
      List<StoringProduct> processed,
      Map<String, ProductDuration> durationMapper,
      Map<String, String> lotNumberMapper) {
    data.clear();
    final List<CheckListItem> list = [];

    for (final p in processed) {
      final item = CheckingProduct(
          barcode: p.barcode,
          unitId: p.unitId,
          type: p.productType,
          qty: p.qty!);
      final newItem = ReceivedItem(
          name: p.productName,
          imageUrl: p.avatarURL,
          item: item,
          count: p.qty,
          weight: "");

      data[item.barcode!] = newItem;

      if (p.expiredDate != null) {
        final duration = ProductDuration(
          expireD: DateTime.tryParse(p.expiredDate ?? "") ?? DateTime.now(),
          issueD: DateTime.tryParse(p.manufactureDate ?? "") ?? DateTime.now(),
          bestUseD: DateTime.tryParse(p.bestBeforeDate ?? "") ?? DateTime.now(),
        );

        durationMapper[p.barcode!] = duration;
      }

      if (p.lotNumber != null) {
        lotNumberMapper[p.barcode!] = p.lotNumber!;
      }

      final history = CheckListItem(
          name: p.productName ?? "",
          sku: p.barcode ?? "",
          imgUrl: p.avatarURL,
          amount: p.qty ?? 1);

      list.add(history);
    }

    return list;
  }

  MapEntry<ReceivedItem, List<CheckListItem>> add(
      ReceiveProduct product, CheckingProduct item, int amount, String weight) {
    var exist = data[item.barcode];

    late ReceivedItem recent;
    var modifyIndex = -1;
    if (exist != null) {
      exist = exist.copyWith(
          count: exist.count! + amount, weight: weight, item: item);

      recent = exist;
      data[item.barcode!] = exist;
    } else {
      final newItem = ReceivedItem(
          name: product.productName,
          imageUrl: product.avatarURL,
          item: item,
          count: amount,
          weight: weight);
      data[item.barcode!] = newItem;
      recent = newItem;
    }

    final List<CheckListItem> list = data.values.select((it, index) {
      if (item.barcode == recent.item?.barcode) {
        modifyIndex = index;
      }

      return _toCheckListItem(it);
    }).toList();

    if (modifyIndex != -1) {
      final found = list.removeAt(modifyIndex);
      list.insert(0, found);
    }

    return MapEntry<ReceivedItem, List<CheckListItem>>(recent, list);
  }

  clear() {
    data.clear();
  }

  CheckListItem _toCheckListItem(ReceivedItem it) {
    return CheckListItem(
        name: it.name ?? "",
        sku: it.item?.barcode ?? "",
        imgUrl: it.imageUrl,
        amount: it.count ?? 1);
  }
}
