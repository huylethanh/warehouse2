import 'package:json_annotation/json_annotation.dart';

part 'attrs.g.dart';

@JsonSerializable()
class Attrs {
  final int? productAttributeId;
  final double? weight;

  Attrs({this.productAttributeId, this.weight});

  factory Attrs.fromJson(Map<String, dynamic> json) => _$AttrsFromJson(json);

  Map<String, dynamic> toJson() => _$AttrsToJson(this);
}
