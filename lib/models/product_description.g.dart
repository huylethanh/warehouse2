// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_description.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductDescriptionCWProxy {
  ProductDescription color(String? color);

  ProductDescription size(String? size);

  ProductDescription text(String? text);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductDescription(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductDescription(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductDescription call({
    String? color,
    String? size,
    String? text,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductDescription.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductDescription.copyWith.fieldName(...)`
class _$ProductDescriptionCWProxyImpl implements _$ProductDescriptionCWProxy {
  final ProductDescription _value;

  const _$ProductDescriptionCWProxyImpl(this._value);

  @override
  ProductDescription color(String? color) => this(color: color);

  @override
  ProductDescription size(String? size) => this(size: size);

  @override
  ProductDescription text(String? text) => this(text: text);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductDescription(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductDescription(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductDescription call({
    Object? color = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
  }) {
    return ProductDescription(
      color: color == const $CopyWithPlaceholder()
          ? _value.color
          // ignore: cast_nullable_to_non_nullable
          : color as String?,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as String?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
    );
  }
}

extension $ProductDescriptionCopyWith on ProductDescription {
  /// Returns a callable class that can be used as follows: `instanceOfProductDescription.copyWith(...)` or like so:`instanceOfProductDescription.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductDescriptionCWProxy get copyWith =>
      _$ProductDescriptionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDescription _$ProductDescriptionFromJson(Map<String, dynamic> json) =>
    ProductDescription(
      text: json['description'] as String?,
      color: json['color'] as String?,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$ProductDescriptionToJson(ProductDescription instance) =>
    <String, dynamic>{
      'description': instance.text,
      'color': instance.color,
      'size': instance.size,
    };
