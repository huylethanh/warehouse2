import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/models.dart';

import 'enum.dart';

part 'storing_product.g.dart';

@JsonSerializable()
@CopyWith()
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
  final String? partnerSKU;
  final String? partnerName;
  final String? productSize;
  final int? productBrandId;
  final String? productBrandName;

  StoringProduct(
      {this.productId,
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
      this.partnerName,
      this.partnerSKU,
      this.productBrandId,
      this.productBrandName,
      this.productSize});

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

  bool isSerial() {
    return productType == ProductType.serial;
  }

  String storageCodeStrings() {
    return details?.map((it) => it.storageCode!).toList().join(" ") ?? "";
  }

  DiffBinTransferSourceProduct toViewBinTransferProduct() {
    final item = DiffBinTransferSourceProduct(
        partnerId: partnerId,
        productId: productId,
        productBarcodeId: productBarcodeId,
        productName: productName,
        avatarUrl: avatarURL,
        qty: qty,
        receivedDate: receivedDate,
        barcode: barcode,
        details: details?.map((it) => it.storageCode!).toList() ?? [],
        advances: advances?.map((it) => it.toView()).toList(),
        partnerName: partnerName,
        partnerSku: partnerSKU,
        conditionTypeId: int.tryParse(conditionTypeId ?? ""),
        unitId: unitId,
        productBrandId: productBrandId,
        productBrandName: productBrandName,
        storageTypeName: storageTypeName);

    return item;
  }

  factory StoringProduct.fromJson(Map<String, dynamic> json) =>
      _$StoringProductFromJson(json);

  Map<String, dynamic> toJson() => _$StoringProductToJson(this);
}
