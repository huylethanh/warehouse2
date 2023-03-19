import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/index.dart';

part 'receive_product.g.dart';

@CopyWith()
@JsonSerializable()
class ReceiveProduct {
  final int? productId;
  final double? expectQty;
  final List<BarcodeObject>? barcodes;
  final String sku;
  final String? productName;

  @JsonKey(name: "productType")
  final ProductType? type;

  final bool? isExpiryDate;
  final double? minShelfLifeInbound;
  final bool? isLotNumber;
  final bool? hasProductSpecific;
  final int? unitId;
  final String? unitName;
  final String? avatarURL;
  final double? actualWeight;
  final double? length;
  final double? width;
  final double? weight;
  final double? height;
  final List<ProductAttributes>? attributes;

  ReceiveProduct({
    this.productId,
    this.expectQty,
    this.barcodes,
    this.sku = "",
    this.productName,
    this.type,
    this.isExpiryDate,
    this.minShelfLifeInbound,
    this.isLotNumber,
    this.hasProductSpecific,
    this.unitId,
    this.unitName,
    this.avatarURL,
    this.actualWeight,
    this.length,
    this.weight,
    this.height,
    this.attributes,
    this.width,
  });

  factory ReceiveProduct.fromJson(Map<String, dynamic> json) =>
      _$ReceiveProductFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveProductToJson(this);

  List<String>? cacheBarcodes;
  List<String> get mBarcodes {
    if (barcodes == null) {
      cacheBarcodes = [];
    }

    // ignore: prefer_conditional_assignment
    if (cacheBarcodes == null) {
      cacheBarcodes = barcodes!.map((e) => e.barcode!).toList();
    }
    return cacheBarcodes ?? [];
  }

  bool isSku(String code) {
    return mBarcodes
        .any((element) => code.toLowerCase() == element.toLowerCase());
  }

  bool missingDimensions() {
    return (actualWeight == null || actualWeight == 0) ||
        (length == null || length == 0) ||
        (width == null || width == 0) ||
        (weight == null || weight == 0) ||
        (height == null || height == 0);
  }

  bool isNonSerial() {
    return type == ProductType.nonSerial;
  }

  bool isCargo() {
    return type == ProductType.cargo;
  }
}
