// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeObject _$BarcodeObjectFromJson(Map<String, dynamic> json) =>
    BarcodeObject(
      productBarcodeId: json['productBarcodeId'] as int?,
      barcode: json['barcode'] as String?,
    );

Map<String, dynamic> _$BarcodeObjectToJson(BarcodeObject instance) =>
    <String, dynamic>{
      'productBarcodeId': instance.productBarcodeId,
      'barcode': instance.barcode,
    };
