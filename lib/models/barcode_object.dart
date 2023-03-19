import 'package:json_annotation/json_annotation.dart';

part 'barcode_object.g.dart';

@JsonSerializable()
class BarcodeObject {
  final int? productBarcodeId;
  final String? barcode;

  BarcodeObject({
    this.productBarcodeId,
    this.barcode,
  });

  factory BarcodeObject.fromJson(Map<String, dynamic> json) =>
      _$BarcodeObjectFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeObjectToJson(this);
}
