import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/index.dart';

part 'checking_product.g.dart';

@JsonSerializable()
class CheckingProduct {
  final String? barcode;

  final int? unitId;
  final ProductType? type;
  final int qty;
  final bool? isConfirm;
  final ProductDuration? date;
  @JsonKey(name: "storageCode")
  final String? serial;
  final String? lotNumber;

  CheckingProduct({
    this.barcode,
    this.unitId,
    this.type,
    this.qty = 1,
    this.isConfirm,
    this.date,
    this.serial,
    this.lotNumber,
  });

  factory CheckingProduct.fromJson(Map<String, dynamic> json) =>
      _$CheckingProductFromJson(json);

  Map<String, dynamic> toJson() => _$CheckingProductToJson(this);
}
