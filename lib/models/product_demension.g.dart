// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_demension.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductDimensionCWProxy {
  ProductDimension actualWeight(double? actualWeight);

  ProductDimension height(double? height);

  ProductDimension length(double? length);

  ProductDimension unitId(int? unitId);

  ProductDimension unitName(String? unitName);

  ProductDimension width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductDimension(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductDimension(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductDimension call({
    double? actualWeight,
    double? height,
    double? length,
    int? unitId,
    String? unitName,
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductDimension.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductDimension.copyWith.fieldName(...)`
class _$ProductDimensionCWProxyImpl implements _$ProductDimensionCWProxy {
  final ProductDimension _value;

  const _$ProductDimensionCWProxyImpl(this._value);

  @override
  ProductDimension actualWeight(double? actualWeight) =>
      this(actualWeight: actualWeight);

  @override
  ProductDimension height(double? height) => this(height: height);

  @override
  ProductDimension length(double? length) => this(length: length);

  @override
  ProductDimension unitId(int? unitId) => this(unitId: unitId);

  @override
  ProductDimension unitName(String? unitName) => this(unitName: unitName);

  @override
  ProductDimension width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductDimension(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductDimension(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductDimension call({
    Object? actualWeight = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
    Object? length = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? unitName = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return ProductDimension(
      actualWeight: actualWeight == const $CopyWithPlaceholder()
          ? _value.actualWeight
          // ignore: cast_nullable_to_non_nullable
          : actualWeight as double?,
      height: height == const $CopyWithPlaceholder()
          ? _value.height
          // ignore: cast_nullable_to_non_nullable
          : height as double?,
      length: length == const $CopyWithPlaceholder()
          ? _value.length
          // ignore: cast_nullable_to_non_nullable
          : length as double?,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as int?,
      unitName: unitName == const $CopyWithPlaceholder()
          ? _value.unitName
          // ignore: cast_nullable_to_non_nullable
          : unitName as String?,
      width: width == const $CopyWithPlaceholder()
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as double?,
    );
  }
}

extension $ProductDimensionCopyWith on ProductDimension {
  /// Returns a callable class that can be used as follows: `instanceOfProductDimension.copyWith(...)` or like so:`instanceOfProductDimension.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductDimensionCWProxy get copyWith => _$ProductDimensionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDimension _$ProductDimensionFromJson(Map<String, dynamic> json) =>
    ProductDimension(
      unitId: json['unitId'] as int?,
      unitName: json['unitName'] as String?,
      actualWeight: (json['actualWeight'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductDimensionToJson(ProductDimension instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'unitName': instance.unitName,
      'actualWeight': instance.actualWeight,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
    };
