// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionType _$ConditionTypeFromJson(Map<String, dynamic> json) =>
    ConditionType(
      conditionTypeId: json['conditionTypeId'] as int?,
      conditionTypeCode: json['conditionTypeCode'] as String?,
      conditionTypeName: json['conditionTypeName'] as String?,
      isException: json['isException'] as bool?,
      isExpiredDate: json['isExpiredDate'] as bool?,
      partnerId: json['partnerId'] as int?,
    );

Map<String, dynamic> _$ConditionTypeToJson(ConditionType instance) =>
    <String, dynamic>{
      'conditionTypeId': instance.conditionTypeId,
      'conditionTypeCode': instance.conditionTypeCode,
      'conditionTypeName': instance.conditionTypeName,
      'isException': instance.isException,
      'isExpiredDate': instance.isExpiredDate,
      'partnerId': instance.partnerId,
    };
