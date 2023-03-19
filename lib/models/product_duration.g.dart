// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_duration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDuration _$ProductDurationFromJson(Map<String, dynamic> json) =>
    ProductDuration(
      expireD: json['expireD'] == null
          ? null
          : DateTime.parse(json['expireD'] as String),
      issueD: json['issueD'] == null
          ? null
          : DateTime.parse(json['issueD'] as String),
      bestUseD: json['bestUseD'] == null
          ? null
          : DateTime.parse(json['bestUseD'] as String),
      manDate: (json['manDate'] as num?)?.toDouble(),
      exp: (json['exp'] as num?)?.toDouble(),
      bestBefore: (json['bestBefore'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductDurationToJson(ProductDuration instance) =>
    <String, dynamic>{
      'expireD': instance.expireD?.toIso8601String(),
      'issueD': instance.issueD?.toIso8601String(),
      'bestUseD': instance.bestUseD?.toIso8601String(),
      'manDate': instance.manDate,
      'exp': instance.exp,
      'bestBefore': instance.bestBefore,
    };
