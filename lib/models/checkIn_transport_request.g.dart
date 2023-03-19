// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkIn_transport_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckInTransportRequest _$CheckInTransportRequestFromJson(
        Map<String, dynamic> json) =>
    CheckInTransportRequest(
      conditionType: json['conditionType'] as int?,
      transportCode: json['transportCode'] as String?,
    );

Map<String, dynamic> _$CheckInTransportRequestToJson(
        CheckInTransportRequest instance) =>
    <String, dynamic>{
      'conditionType': instance.conditionType,
      'transportCode': instance.transportCode,
    };
