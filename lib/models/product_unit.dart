import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_unit.g.dart';

@CopyWith()
@JsonSerializable()
class ProductUnit {
  @JsonKey(name: "unitId")
  final int? id;
  @JsonKey(name: "unitCode")
  final String? code;
  @JsonKey(name: "unitName")
  final String? name;
  final double? actualWeight;
  final double? length;
  final double? width;
  final double? height;

  ProductUnit({
    this.id,
    this.code,
    this.name,
    this.actualWeight,
    this.length,
    this.width,
    this.height,
  });

  factory ProductUnit.fromJson(Map<String, dynamic> json) =>
      _$ProductUnitFromJson(json);

  Map<String, dynamic> toJson() => _$ProductUnitToJson(this);

  bool missingDimension() {
    return actualWeight == null ||
        length == null ||
        width == null ||
        height == null;
  }
}
