import 'package:copy_with_extension/copy_with_extension.dart';

import 'check_list_item.dart';

part 'new_transport.g.dart';

@CopyWith()
class NewTransport {
  final String? transportCode;
  final int total;
  final List<CheckListItem> checkList;
  final String partner;
  final String weight;

  NewTransport({
    this.transportCode,
    this.total = 0,
    this.checkList = const [],
    this.partner = "",
    this.weight = "",
  });
}
