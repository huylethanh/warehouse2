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
      (index, orSession) {
        final DateTime? date = DateTime.tryParse(orSession.createdDate ?? "");
        final minute = date?.minute ?? 0;

        items.add(
          ORViewItem(
              pickListId: orSession.id,
              code: orSession.code,
              orAmount: orSession.orderCount.toString(),
              productAmount: orSession.productCount.toString(),
              sizeName: orSession.sizeName,
              createdDate: orSession.createdDate,
              dataIndex: index,
              priority: orSession.priority,
              currentMinute: minute),
        );
      },
    );

    return items;
  }
}
