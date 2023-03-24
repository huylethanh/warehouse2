import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:warehouse_app/models/models.dart';

part 'receive_item.g.dart';

@CopyWith(copyWithNull: true)
class ReceivedItem {
  final String? name;
  final String? imageUrl;
  final CheckingProduct? item;
  final int? count;
  final String? weight;

  ReceivedItem({
    this.name,
    this.imageUrl,
    this.item,
    this.count,
    this.weight,
  });
}
