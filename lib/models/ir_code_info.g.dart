// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_code_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IrCodeInfo _$IrCodeInfoFromJson(Map<String, dynamic> json) => IrCodeInfo(
      irId: json['irId'] as int?,
      irCode: json['irCode'] as String?,
      receivedDate: json['receivedDate'] as String?,
      qty: json['qty'] as int?,
    );

Map<String, dynamic> _$IrCodeInfoToJson(IrCodeInfo instance) =>
    <String, dynamic>{
      'irId': instance.irId,
      'irCode': instance.irCode,
      'receivedDate': instance.receivedDate,
      'qty': instance.qty,
    };
