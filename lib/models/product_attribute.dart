import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/models.dart';

part 'product_attribute.g.dart';

@CopyWith()
@JsonSerializable()
class ProductAttributes {
  @JsonKey(name: "productAttributeId")
  final int? id;

  @JsonKey(name: "productAttributeCode")
  final String? storageCode;

  final Attrs? attribute;

  @JsonKey(name: "weight")
  final double? w;

  final int? outboundOrderIndex;
  final int pIndex;

  ProductAttributes({
    this.id,
    this.storageCode,
    this.attribute,
    this.w,
    this.outboundOrderIndex,
    this.pIndex = 0,
  });

  factory ProductAttributes.fromJson(Map<String, dynamic> json) =>
      _$ProductAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAttributesToJson(this);

  double? get weight {
    if (w == null) {
      return attribute?.weight;
    }

    return w;
  }

  String formatWeight() {
    if (weight == null) {
      return "";
    }

    return "${(weight! / 1000)} kg";
  }

  bool requireWeight() {
    return weight == null;
  }
}
