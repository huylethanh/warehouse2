import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'picking_bin.dart';
import 'pick_product.dart';

part 'picking_path.g.dart';

@CopyWith()
@JsonSerializable()
class PickingPath {
  final int? pickListId;
  final String? pickListCode;
  final int? pickSessionId;
  final int? numOfOR;
  final int? numOfItem;
  final String? sizeName;
  final String? createdDate;
  final int? priority;
  final List<PickProduct>? products;
  final List<PickingBin>? bins;

  PickingPath({
    this.pickListId,
    this.pickListCode,
    this.pickSessionId,
    this.numOfOR,
    this.numOfItem,
    this.sizeName,
    this.createdDate,
    this.priority,
    this.products,
    this.bins,
  });

  factory PickingPath.fromJson(Map<String, dynamic> json) =>
      _$PickingPathFromJson(json);

  Map<String, dynamic> toJson() => _$PickingPathToJson(this);
}
