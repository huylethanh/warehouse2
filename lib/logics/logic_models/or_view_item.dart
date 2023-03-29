import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'or_view_item.g.dart';

@CopyWith()
@JsonSerializable()
class ORViewItem {
  final int? pickListId;
  final String? code;
  final String? orAmount;
  final String? productAmount;
  final String? sizeName;
  final String? createdDate;
  final int? dataIndex;
  final bool chosen;
  final int? priority;
  final int currentMinute;

  ORViewItem({
    this.pickListId,
    this.code,
    this.orAmount,
    this.productAmount,
    this.sizeName,
    this.createdDate,
    this.dataIndex,
    this.chosen = false,
    this.priority,
    this.currentMinute = 0,
  });

  factory ORViewItem.fromJson(Map<String, dynamic> json) =>
      _$ORViewItemFromJson(json);

  Map<String, dynamic> toJson() => _$ORViewItemToJson(this);

  bool areItemsTheSame(ORViewItem oldItem, ORViewItem newItem) {
    return oldItem.code == newItem.code;
  }

  bool areContentsTheSame(ORViewItem oldItem, ORViewItem newItem) {
    return oldItem.currentMinute == newItem.currentMinute;
  }
}
