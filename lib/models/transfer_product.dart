import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer_product.g.dart';

@CopyWith()
@JsonSerializable()
class TransferProduct {
  final int? productId;
  final String? sku;
  final String? serial;

  TransferProduct({
    this.productId,
    this.sku,
    this.serial,
  });

  factory TransferProduct.fromJson(Map<String, dynamic> json) =>
      _$TransferProductFromJson(json);

  Map<String, dynamic> toJson() => _$TransferProductToJson(this);
}
