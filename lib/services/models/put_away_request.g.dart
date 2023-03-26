// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_away_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutAwayRequest _$PutAwayRequestFromJson(Map<String, dynamic> json) =>
    PutAwayRequest(
      processAll: json['processAll'] as bool?,
      transportCode: json['transportCode'] as String?,
      productBarcodeId: json['productBarcodeId'] as int?,
      serial: json['serial'] as String?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$PutAwayRequestToJson(PutAwayRequest instance) =>
    <String, dynamic>{
      'processAll': instance.processAll,
      'transportCode': instance.transportCode,
      'productBarcodeId': instance.productBarcodeId,
      'serial': instance.serial,
      'quantity': instance.quantity,
    };
