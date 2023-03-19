import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_demension.g.dart';

@CopyWith()
@JsonSerializable()
class ProductDimension {
  final int? unitId;
  final String? unitName;
  final double? actualWeight;
  final double? length;
  final double? width;
  final double? height;

  ProductDimension({
    this.unitId,
    this.unitName,
    this.actualWeight,
    this.length,
    this.width,
    this.height,
  });

  factory ProductDimension.fromJson(Map<String, dynamic> json) =>
      _$ProductDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDimensionToJson(this);
}
