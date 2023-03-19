// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveModel _$ReceiveModelFromJson(Map<String, dynamic> json) => ReceiveModel(
      irId: json['irId'] as int?,
      code: json['code'] as String?,
      partnerCode: json['partnerCode'] as String?,
      shortName: json['shortName'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      irCode: json['irCode'] as String?,
      warehouseId: json['warehouseId'] as int?,
    );

Map<String, dynamic> _$ReceiveModelToJson(ReceiveModel instance) =>
    <String, dynamic>{
      'irId': instance.irId,
      'code': instance.code,
      'partnerCode': instance.partnerCode,
      'shortName': instance.shortName,
      'createdDate': instance.createdDate?.toIso8601String(),
      'irCode': instance.irCode,
      'warehouseId': instance.warehouseId,
    };
