import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/models.dart';

part 'picking_bin.g.dart';

@CopyWith()
@JsonSerializable()
class PickingBin {
  @JsonKey(name: "binLocationId")
  final int? id;

  @JsonKey(name: "binLocationCode")
  final String? bin;

  @JsonKey(name: "pickingActions")
  final List<PickingItem>? pickList;

  @JsonKey(name: "isGetFullBin")
  final bool? canPickAll;

  PickingBin({
    this.id,
    this.bin,
    this.pickList,
    this.canPickAll,
  });

  factory PickingBin.fromJson(Map<String, dynamic> json) =>
      _$PickingBinFromJson(json);

  Map<String, dynamic> toJson() => _$PickingBinToJson(this);
}
