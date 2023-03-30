import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/services.dart';

import 'logic_models/or_view_item.dart';

class GetORList {
  final _service = PickingService();

  final List<ORPicking> originalData = [];

  Future<List<ORViewItem>> execute() async {
    final result = await _service.orList();
    if (result.hasError) {
      return [];
    }

    final list = result.data!;
    originalData.addAll(list);

    final List<ORViewItem> items = [];
    list.asMap().forEach(
      (index, orPickingItem) {
        final DateTime? date =
            DateTime.tryParse(orPickingItem.createdDate ?? "");
        final minute = date?.minute ?? 0;

        items.add(
          ORViewItem(
            pickListId: orPickingItem.id,
            code: orPickingItem.code,
            orAmount: orPickingItem.orderCount.toString(),
            productAmount: orPickingItem.productCount.toString(),
            sizeName: orPickingItem.sizeName,
            createdDate: orPickingItem.createdDate,
            dataIndex: index,
            priority: orPickingItem.priority,
            currentMinute: minute,
            orPicking: orPickingItem,
          ),
        );
      },
    );

    return items;
  }
}
