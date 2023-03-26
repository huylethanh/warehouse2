// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inventory _$InventoryFromJson(Map<String, dynamic> json) => Inventory(
      locationCode: json['locationCode'] as String?,
      status: json['status'] as String?,
      physicalType: json['physicalType'] as String?,
      updatedDate: json['updatedDate'] as String?,
      updatedBy: json['updatedBy'] as int?,
      updatedByName: json['updatedByName'] as String?,
      maxNumberSKU: json['maxNumberSKU'] as int?,
      currentNumberSKU: json['currentNumberSKU'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => StoringProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InventoryToJson(Inventory instance) => <String, dynamic>{
      'locationCode': instance.locationCode,
      'status': instance.status,
      'physicalType': instance.physicalType,
      'updatedDate': instance.updatedDate,
      'updatedBy': instance.updatedBy,
      'updatedByName': instance.updatedByName,
      'maxNumberSKU': instance.maxNumberSKU,
      'currentNumberSKU': instance.currentNumberSKU,
      'items': instance.items,
    };
