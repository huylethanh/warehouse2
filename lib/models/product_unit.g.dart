// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_unit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductUnitCWProxy {
  ProductUnit actualWeight(double? actualWeight);

  ProductUnit code(String? code);

  ProductUnit height(double? height);

  ProductUnit id(int? id);

  ProductUnit length(double? length);

  ProductUnit name(String? name);

  ProductUnit width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductUnit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductUnit(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductUnit call({
    double? actualWeight,
    String? code,
    double? height,
    int? id,
    double? length,
    String? name,
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductUnit.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductUnit.copyWith.fieldName(...)`
class _$ProductUnitCWProxyImpl implements _$ProductUnitCWProxy {
  final ProductUnit _value;

  const _$ProductUnitCWProxyImpl(this._value);

  @override
  ProductUnit actualWeight(double? actualWeight) =>
      this(actualWeight: actualWeight);

  @override
  ProductUnit code(String? code) => this(code: code);

  @override
  ProductUnit height(double? height) => this(height: height);

  @override
  ProductUnit id(int? id) => this(id: id);

  @override
  ProductUnit length(double? length) => this(length: length);

  @override
  ProductUnit name(String? name) => this(name: name);

  @override
  ProductUnit width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductUnit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductUnit(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductUnit call({
    Object? actualWeight = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? length = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return ProductUnit(
      actualWeight: actualWeight == const $CopyWithPlaceholder()
          ? _value.actualWeight
          // ignore: cast_nullable_to_non_nullable
          : actualWeight as double?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      height: height == const $CopyWithPlaceholder()
          ? _value.height
          // ignore: cast_nullable_to_non_nullable
          : height as double?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      length: length == const $CopyWithPlaceholder()
          ? _value.length
          // ignore: cast_nullable_to_non_nullable
          : length as double?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      width: width == const $CopyWithPlaceholder()
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as double?,
    );
  }
}

extension $ProductUnitCopyWith on ProductUnit {
  /// Returns a callable class that can be used as follows: `instanceOfProductUnit.copyWith(...)` or like so:`instanceOfProductUnit.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductUnitCWProxy get copyWith => _$ProductUnitCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductUnit _$ProductUnitFromJson(Map<String, dynamic> json) => ProductUnit(
      id: json['unitId'] as int?,
      code: json['unitCode'] as String?,
      name: json['unitName'] as String?,
      actualWeight: (json['actualWeight'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductUnitToJson(ProductUnit instance) =>
    <String, dynamic>{
      'unitId': instance.id,
      'unitCode': instance.code,
      'unitName': instance.name,
      'actualWeight': instance.actualWeight,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
    };
