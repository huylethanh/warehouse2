// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_attribute.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductAttributesCWProxy {
  ProductAttributes attribute(Attrs? attribute);

  ProductAttributes id(int? id);

  ProductAttributes outboundOrderIndex(int? outboundOrderIndex);

  ProductAttributes pIndex(int pIndex);

  ProductAttributes storageCode(String? storageCode);

  ProductAttributes w(double? w);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductAttributes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductAttributes(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductAttributes call({
    Attrs? attribute,
    int? id,
    int? outboundOrderIndex,
    int? pIndex,
    String? storageCode,
    double? w,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductAttributes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductAttributes.copyWith.fieldName(...)`
class _$ProductAttributesCWProxyImpl implements _$ProductAttributesCWProxy {
  final ProductAttributes _value;

  const _$ProductAttributesCWProxyImpl(this._value);

  @override
  ProductAttributes attribute(Attrs? attribute) => this(attribute: attribute);

  @override
  ProductAttributes id(int? id) => this(id: id);

  @override
  ProductAttributes outboundOrderIndex(int? outboundOrderIndex) =>
      this(outboundOrderIndex: outboundOrderIndex);

  @override
  ProductAttributes pIndex(int pIndex) => this(pIndex: pIndex);

  @override
  ProductAttributes storageCode(String? storageCode) =>
      this(storageCode: storageCode);

  @override
  ProductAttributes w(double? w) => this(w: w);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductAttributes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductAttributes(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductAttributes call({
    Object? attribute = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? outboundOrderIndex = const $CopyWithPlaceholder(),
    Object? pIndex = const $CopyWithPlaceholder(),
    Object? storageCode = const $CopyWithPlaceholder(),
    Object? w = const $CopyWithPlaceholder(),
  }) {
    return ProductAttributes(
      attribute: attribute == const $CopyWithPlaceholder()
          ? _value.attribute
          // ignore: cast_nullable_to_non_nullable
          : attribute as Attrs?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      outboundOrderIndex: outboundOrderIndex == const $CopyWithPlaceholder()
          ? _value.outboundOrderIndex
          // ignore: cast_nullable_to_non_nullable
          : outboundOrderIndex as int?,
      pIndex: pIndex == const $CopyWithPlaceholder() || pIndex == null
          ? _value.pIndex
          // ignore: cast_nullable_to_non_nullable
          : pIndex as int,
      storageCode: storageCode == const $CopyWithPlaceholder()
          ? _value.storageCode
          // ignore: cast_nullable_to_non_nullable
          : storageCode as String?,
      w: w == const $CopyWithPlaceholder()
          ? _value.w
          // ignore: cast_nullable_to_non_nullable
          : w as double?,
    );
  }
}

extension $ProductAttributesCopyWith on ProductAttributes {
  /// Returns a callable class that can be used as follows: `instanceOfProductAttributes.copyWith(...)` or like so:`instanceOfProductAttributes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductAttributesCWProxy get copyWith =>
      _$ProductAttributesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAttributes _$ProductAttributesFromJson(Map<String, dynamic> json) =>
    ProductAttributes(
      id: json['productAttributeId'] as int?,
      storageCode: json['productAttributeCode'] as String?,
      attribute: json['attribute'] == null
          ? null
          : Attrs.fromJson(json['attribute'] as Map<String, dynamic>),
      w: (json['weight'] as num?)?.toDouble(),
      outboundOrderIndex: json['outboundOrderIndex'] as int?,
      pIndex: json['pIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductAttributesToJson(ProductAttributes instance) =>
    <String, dynamic>{
      'productAttributeId': instance.id,
      'productAttributeCode': instance.storageCode,
      'attribute': instance.attribute,
      'weight': instance.w,
      'outboundOrderIndex': instance.outboundOrderIndex,
      'pIndex': instance.pIndex,
    };
