import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picking_item.g.dart';

@CopyWith()
@JsonSerializable()
class PickingItem {
  @JsonKey(name: "pickUpLocationId")
  final int? locationId;

  @JsonKey(name: "pickUpLocationCode")
  final String? locationCode;

  @JsonKey(name: "pickUpLocationIndex")
  final int? locationIndex;

  @JsonKey(name: "productBarcodeId")
  final int? productId;

  @JsonKey(name: "qty")
  final int? quantity;

  final int? unitId;

  @JsonKey(name: "storageCodes")
  final List<String>? storageCodes;

  PickingItem({
    this.locationId,
    this.locationCode,
    this.locationIndex,
    this.productId,
    this.quantity,
    this.unitId,
    this.storageCodes,
  });

  factory PickingItem.fromJson(Map<String, dynamic> json) =>
      _$PickingItemFromJson(json);

  Map<String, dynamic> toJson() => _$PickingItemToJson(this);
}
