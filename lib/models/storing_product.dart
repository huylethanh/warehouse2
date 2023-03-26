import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/models.dart';

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
  final String? conditionTypeId;
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

  List<String>? _serials;
  List<String> get serials {
    if (_serials == null) {
      _serials = [];

      for (final it in details ?? []) {
        _serials!.add(it.storageCode);
      }
    }
    return _serials!;
  }

  bool isBatch() {
    return productType == ProductType.nonSerial;
  }

  String storageTypeString() {
    final strBuilder = StringBuffer();
    strBuilder.write(storageTypeName ?? "");

    if (storageTypeName != null && conditionTypeName != null) {
      strBuilder.write(". ");
    }
    strBuilder
        .write(conditionTypeName != null ? "TTHH: $conditionTypeName" : "");

    return strBuilder.toString();
  }

  factory StoringProduct.fromJson(Map<String, dynamic> json) =>
      _$StoringProductFromJson(json);

  Map<String, dynamic> toJson() => _$StoringProductToJson(this);
}
