// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storing_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoringProduct _$StoringProductFromJson(Map<String, dynamic> json) =>
    StoringProduct(
      productId: json['productId'] as int?,
      productBarcodeId: json['productBarcodeId'] as int?,
      barcode: json['barcode'] as String?,
      qty: json['qty'] as int?,
      productType:
          $enumDecodeNullable(_$ProductTypeEnumMap, json['productType']),
      productName: json['productName'] as String?,
      avatarURL: json['avatarURL'] as String?,
      pendingOutQty: json['pendingOutQty'] as int?,
      conditionTypeId: json['conditionTypeId'] as String?,
      conditionTypeName: json['conditionTypeName'] as String?,
      unitId: json['unitId'] as int?,
      unitName: json['unitName'] as String?,
      partnerId: json['partnerId'] as int?,
      receivedDate: json['receivedDate'] as String?,
      expiredDate: json['expiredDate'] as String?,
      manufactureDate: json['manufactureDate'] as String?,
      bestBeforeDate: json['bestBeforeDate'] as String?,
      lotNumber: json['lotNumber'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => ProductAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      advances: (json['advances'] as List<dynamic>?)
          ?.map((e) => IrCodeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetType: json['assetType'] as int?,
      storageTypeName: json['storageTypeName'] as String?,
    );

Map<String, dynamic> _$StoringProductToJson(StoringProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productBarcodeId': instance.productBarcodeId,
      'barcode': instance.barcode,
      'qty': instance.qty,
      'productType': _$ProductTypeEnumMap[instance.productType],
      'productName': instance.productName,
      'avatarURL': instance.avatarURL,
      'pendingOutQty': instance.pendingOutQty,
      'conditionTypeId': instance.conditionTypeId,
      'conditionTypeName': instance.conditionTypeName,
      'unitId': instance.unitId,
      'unitName': instance.unitName,
      'partnerId': instance.partnerId,
      'receivedDate': instance.receivedDate,
      'expiredDate': instance.expiredDate,
      'manufactureDate': instance.manufactureDate,
      'bestBeforeDate': instance.bestBeforeDate,
      'lotNumber': instance.lotNumber,
      'details': instance.details,
      'advances': instance.advances,
      'assetType': instance.assetType,
      'storageTypeName': instance.storageTypeName,
    };

const _$ProductTypeEnumMap = {
  ProductType.serial: 1,
  ProductType.nonSerial: 2,
  ProductType.cargo: 3,
};
