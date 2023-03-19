// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCodeResponse _$CheckCodeResponseFromJson(Map<String, dynamic> json) =>
    CheckCodeResponse(
      locationId: json['locationId'] as int?,
      locationCode: json['locationCode'] as String?,
      locationType: json['locationType'] as int?,
      physicalType: json['physicalType'] as int?,
      status: json['status'] as int?,
      maxNumberSKU: json['maxNumberSKU'] as int?,
      currentNumberSKU: json['currentNumberSKU'] as int?,
      isPickable: json['isPickable'] as bool?,
    );

Map<String, dynamic> _$CheckCodeResponseToJson(CheckCodeResponse instance) =>
    <String, dynamic>{
      'locationId': instance.locationId,
      'locationCode': instance.locationCode,
      'locationType': instance.locationType,
      'physicalType': instance.physicalType,
      'status': instance.status,
      'maxNumberSKU': instance.maxNumberSKU,
      'currentNumberSKU': instance.currentNumberSKU,
      'isPickable': instance.isPickable,
    };
