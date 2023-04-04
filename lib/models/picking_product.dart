import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picking_product.g.dart';

@CopyWith()
@JsonSerializable()
class PickingProduct {
  final int? productId;
  final String? sku;

  @JsonKey(name: "qty")
  final int? quantity;

  final String? typeLabel;
  final int? unitId;
  final String? serial;

  PickingProduct({
    this.productId,
    this.sku,
    this.quantity,
    this.typeLabel,
    this.unitId,
    this.serial,
  });

  factory PickingProduct.fromJson(Map<String, dynamic> json) =>
      _$PickingProductFromJson(json);

  Map<String, dynamic> toJson() => _$PickingProductToJson(this);
}
