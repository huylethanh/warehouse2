import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'or_picking.g.dart';

@CopyWith()
@JsonSerializable()
class ORPicking {
  @JsonKey(name: "pickListId")
  final int? id;

  @JsonKey(name: "pickListCode")
  final String? code;

  @JsonKey(name: "numOfOR")
  final int? orderCount;

  @JsonKey(name: "numOfItem")
  final int? productCount;

  final String? sizeName;
  final String? createdDate;
  final int? numOfTransport;
  final int? priority;

  ORPicking({
    this.id,
    this.code,
    this.orderCount,
    this.productCount,
    this.sizeName,
    this.createdDate,
    this.numOfTransport,
    this.priority,
  });

  factory ORPicking.fromJson(Map<String, dynamic> json) =>
      _$ORPickingFromJson(json);

  Map<String, dynamic> toJson() => _$ORPickingToJson(this);
}
