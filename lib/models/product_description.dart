import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_description.g.dart';

@CopyWith()
@JsonSerializable()
class ProductDescription {
  @JsonKey(name: "description")
  final String? text;
  final String? color;
  final String? size;

  ProductDescription({
    this.text,
    this.color,
    this.size,
  });

  factory ProductDescription.fromJson(Map<String, dynamic> json) =>
      _$ProductDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDescriptionToJson(this);
}
