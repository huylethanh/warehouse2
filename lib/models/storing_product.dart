import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/index.dart';

import 'enum.dart';

part 'storing_product.g.dart';

@JsonSerializable()
class StoringProduct {
  final int? productId;
  final int? productBarcodeId;
  final String? barcode;
  final int? qty;
  final ProductType? productType;
  final String? productName;
  final String? avatarURL;
  final int? pendingOutQty;
  final int? conditionTypeId;
  final String? conditionTypeName;
  final int? unitId;
  final String? unitName;
  final int? partnerId;
  final String? receivedDate;
  final String? expiredDate;
  final String? manufactureDate;
  final String? bestBeforeDate;
  final String? lotNumber;
  final List<ProductAttributes>? details;
  final List<IrCodeInfo>? advances;
  final int? assetType;
  final String? storageTypeName;

  StoringProduct({
    this.productId,
    this.productBarcodeId,
    this.barcode,
    this.qty,
    this.productType,
    this.productName,
    this.avatarURL,
    this.pendingOutQty,
    this.conditionTypeId,
    this.conditionTypeName,
    this.unitId,
    this.unitName,
    this.partnerId,
    this.receivedDate,
    this.expiredDate,
    this.manufactureDate,
    this.bestBeforeDate,
    this.lotNumber,
    this.details,
    this.advances,
    this.assetType,
    this.storageTypeName,
  });

  factory StoringProduct.fromJson(Map<String, dynamic> json) =>
      _$StoringProductFromJson(json);

  Map<String, dynamic> toJson() => _$StoringProductToJson(this);
}
