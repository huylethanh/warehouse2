// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbound_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InboundResponse _$InboundResponseFromJson(Map<String, dynamic> json) =>
    InboundResponse(
      irId: json['irId'] as int?,
      orId: json['orId'] as int?,
      irCode: json['irCode'] as String?,
      irStatus: json['irStatus'] as int?,
      conditionType: json['conditionType'] as int?,
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) => ReceiveProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InboundResponseToJson(InboundResponse instance) =>
    <String, dynamic>{
      'irId': instance.irId,
      'orId': instance.orId,
      'irCode': instance.irCode,
      'irStatus': instance.irStatus,
      'conditionType': instance.conditionType,
      'detail': instance.detail,
    };
