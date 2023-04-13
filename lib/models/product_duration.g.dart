// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_duration.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductDurationCWProxy {
  ProductDuration bestBefore(double? bestBefore);

  ProductDuration bestUseD(DateTime? bestUseD);

  ProductDuration exp(double? exp);

  ProductDuration expireD(DateTime? expireD);

  ProductDuration issueD(DateTime? issueD);

  ProductDuration manDate(double? manDate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductDuration(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductDuration(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductDuration call({
    double? bestBefore,
    DateTime? bestUseD,
    double? exp,
    DateTime? expireD,
    DateTime? issueD,
    double? manDate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductDuration.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductDuration.copyWith.fieldName(...)`
class _$ProductDurationCWProxyImpl implements _$ProductDurationCWProxy {
  final ProductDuration _value;

  const _$ProductDurationCWProxyImpl(this._value);

  @override
  ProductDuration bestBefore(double? bestBefore) =>
      this(bestBefore: bestBefore);

  @override
  ProductDuration bestUseD(DateTime? bestUseD) => this(bestUseD: bestUseD);

  @override
  ProductDuration exp(double? exp) => this(exp: exp);

  @override
  ProductDuration expireD(DateTime? expireD) => this(expireD: expireD);

  @override
  ProductDuration issueD(DateTime? issueD) => this(issueD: issueD);

  @override
  ProductDuration manDate(double? manDate) => this(manDate: manDate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductDuration(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductDuration(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductDuration call({
    Object? bestBefore = const $CopyWithPlaceholder(),
    Object? bestUseD = const $CopyWithPlaceholder(),
    Object? exp = const $CopyWithPlaceholder(),
    Object? expireD = const $CopyWithPlaceholder(),
    Object? issueD = const $CopyWithPlaceholder(),
    Object? manDate = const $CopyWithPlaceholder(),
  }) {
    return ProductDuration(
      bestBefore: bestBefore == const $CopyWithPlaceholder()
          ? _value.bestBefore
          // ignore: cast_nullable_to_non_nullable
          : bestBefore as double?,
      bestUseD: bestUseD == const $CopyWithPlaceholder()
          ? _value.bestUseD
          // ignore: cast_nullable_to_non_nullable
          : bestUseD as DateTime?,
      exp: exp == const $CopyWithPlaceholder()
          ? _value.exp
          // ignore: cast_nullable_to_non_nullable
          : exp as double?,
      expireD: expireD == const $CopyWithPlaceholder()
          ? _value.expireD
          // ignore: cast_nullable_to_non_nullable
          : expireD as DateTime?,
      issueD: issueD == const $CopyWithPlaceholder()
          ? _value.issueD
          // ignore: cast_nullable_to_non_nullable
          : issueD as DateTime?,
      manDate: manDate == const $CopyWithPlaceholder()
          ? _value.manDate
          // ignore: cast_nullable_to_non_nullable
          : manDate as double?,
    );
  }
}

extension $ProductDurationCopyWith on ProductDuration {
  /// Returns a callable class that can be used as follows: `instanceOfProductDuration.copyWith(...)` or like so:`instanceOfProductDuration.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductDurationCWProxy get copyWith => _$ProductDurationCWProxyImpl(this);
}

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
