import 'package:warehouse_app/view_models/models/check_list_item.dart';
import 'package:warehouse_app/view_models/models/put_away_item.dart';

import 'inbound_product.dart';

class PutAwayList {
  final data = <String, PutAwayitem>{};

  List<CheckListItem> init(List<InboundProduct> list) {
    for (final product in list) {
      final exist = data[product.sku];

      if (exist != null) {
        exist.count = exist.count + (product.quantity ?? 1);
      } else {
        final item = PutAwayitem(product, product.quantity ?? 1);
        data[product.sku!] = item;
      }
    }

    return data.values
        .map((e) => CheckListItem(
              name: e.product.name!,
              sku: e.product.sku!,
              imgUrl: e.product.image,
              amount: e.count,
              condition: e.product.condition!,
            ))
        .toList();
  }

  List<CheckListItem> remove(InboundProduct product, int quantity) {
    final exist = data[product.sku];

    if (exist == null) {
      return [];
    }

    PutAwayitem? recent = exist;

    if (exist != null) {
      final count = exist.count - quantity;
      if (count <= 0) {
        data.remove(exist.product.sku);
      } else {
        exist.count = count;
      }
    }

    if (data.containsKey(exist.product.sku)) {
      return data.values
          .map((e) => CheckListItem(
                name: e.product.name!,
                sku: e.product.sku!,
                imgUrl: e.product.image,
                amount: e.count,
                condition: e.product.condition!,
              ))
          .toList();
    }

    return [];
  }

  void clear() {
    data.clear();
  }
}
