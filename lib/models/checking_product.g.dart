// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checking_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckingProduct _$CheckingProductFromJson(Map<String, dynamic> json) =>
    CheckingProduct(
      barcode: json['barcode'] as String?,
      unitId: json['unitId'] as int?,
      type: $enumDecodeNullable(_$ProductTypeEnumMap, json['type']),
      qty: json['qty'] as int? ?? 1,
      isConfirm: json['isConfirm'] as bool?,
      date: json['date'] == null
          ? null
          : ProductDuration.fromJson(json['date'] as Map<String, dynamic>),
      serial: json['storageCode'] as String?,
      lotNumber: json['lotNumber'] as String?,
    );

Map<String, dynamic> _$CheckingProductToJson(CheckingProduct instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'unitId': instance.unitId,
      'type': _$ProductTypeEnumMap[instance.type],
      'qty': instance.qty,
      'isConfirm': instance.isConfirm,
      'date': instance.date,
      'storageCode': instance.serial,
      'lotNumber': instance.lotNumber,
    };

const _$ProductTypeEnumMap = {
  ProductType.serial: 1,
  ProductType.nonSerial: 2,
  ProductType.cargo: 3,
};
