// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attrs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attrs _$AttrsFromJson(Map<String, dynamic> json) => Attrs(
      productAttributeId: json['productAttributeId'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AttrsToJson(Attrs instance) => <String, dynamic>{
      'productAttributeId': instance.productAttributeId,
      'weight': instance.weight,
    };
