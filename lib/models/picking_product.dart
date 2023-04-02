import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'enum.dart';
import 'product_description.dart';

part 'picking_product.g.dart';

@CopyWith()
@JsonSerializable()
class PickingProduct {
  final int? productBarcodeId;
  final String? barcode;
  final ProductType? productType;
  final int? quantity;

  @JsonKey(name: "productDescription")
  final ProductDescription? description;

  @JsonKey(name: "productName")
  final String? name;

  @JsonKey(name: "avatarURL")
  final String? image;

  final List<String> storageCodes;
  final int unitId;

  PickingProduct({
    this.productBarcodeId,
    this.barcode,
    this.productType,
    this.quantity,
    this.description,
    this.name,
    this.image,
    this.storageCodes = const [],
    this.unitId = 0,
  });

  static PickingProduct dummy() {
    return PickingProduct(
      productBarcodeId: 0,
      barcode: "n/a",
      productType: ProductType.nonSerial,
      quantity: 0,
      name: "n/a",
      image: null,
      description: ProductDescription(text: "", color: "", size: ""),
    );
  }

  bool isSerial() {
    return productType == ProductType.serial;
  }

  bool isAttribute() {
    return productType == ProductType.cargo;
  }

  factory PickingProduct.fromJson(Map<String, dynamic> json) =>
      _$PickingProductFromJson(json);

  Map<String, dynamic> toJson() => _$PickingProductToJson(this);
}
