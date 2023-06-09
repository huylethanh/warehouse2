// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_product.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PickProductCWProxy {
  PickProduct barcode(String? barcode);

  PickProduct description(ProductDescription? description);

  PickProduct image(String? image);

  PickProduct name(String? name);

  PickProduct productBarcodeId(int? productBarcodeId);

  PickProduct productType(ProductType? productType);

  PickProduct quantity(int? quantity);

  PickProduct storageCodes(List<String> storageCodes);

  PickProduct unitId(int unitId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  PickProduct call({
    String? barcode,
    ProductDescription? description,
    String? image,
    String? name,
    int? productBarcodeId,
    ProductType? productType,
    int? quantity,
    List<String>? storageCodes,
    int? unitId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPickProduct.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPickProduct.copyWith.fieldName(...)`
class _$PickProductCWProxyImpl implements _$PickProductCWProxy {
  final PickProduct _value;

  const _$PickProductCWProxyImpl(this._value);

  @override
  PickProduct barcode(String? barcode) => this(barcode: barcode);

  @override
  PickProduct description(ProductDescription? description) =>
      this(description: description);

  @override
  PickProduct image(String? image) => this(image: image);

  @override
  PickProduct name(String? name) => this(name: name);

  @override
  PickProduct productBarcodeId(int? productBarcodeId) =>
      this(productBarcodeId: productBarcodeId);

  @override
  PickProduct productType(ProductType? productType) =>
      this(productType: productType);

  @override
  PickProduct quantity(int? quantity) => this(quantity: quantity);

  @override
  PickProduct storageCodes(List<String> storageCodes) =>
      this(storageCodes: storageCodes);

  @override
  PickProduct unitId(int unitId) => this(unitId: unitId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  PickProduct call({
    Object? barcode = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? productBarcodeId = const $CopyWithPlaceholder(),
    Object? productType = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? storageCodes = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
  }) {
    return PickProduct(
      barcode: barcode == const $CopyWithPlaceholder()
          ? _value.barcode
          // ignore: cast_nullable_to_non_nullable
          : barcode as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as ProductDescription?,
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      productBarcodeId: productBarcodeId == const $CopyWithPlaceholder()
          ? _value.productBarcodeId
          // ignore: cast_nullable_to_non_nullable
          : productBarcodeId as int?,
      productType: productType == const $CopyWithPlaceholder()
          ? _value.productType
          // ignore: cast_nullable_to_non_nullable
          : productType as ProductType?,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int?,
      storageCodes:
          storageCodes == const $CopyWithPlaceholder() || storageCodes == null
              ? _value.storageCodes
              // ignore: cast_nullable_to_non_nullable
              : storageCodes as List<String>,
      unitId: unitId == const $CopyWithPlaceholder() || unitId == null
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as int,
    );
  }
}

extension $PickProductCopyWith on PickProduct {
  /// Returns a callable class that can be used as follows: `instanceOfPickProduct.copyWith(...)` or like so:`instanceOfPickProduct.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PickProductCWProxy get copyWith => _$PickProductCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickProduct _$PickProductFromJson(Map<String, dynamic> json) => PickProduct(
      productBarcodeId: json['productBarcodeId'] as int?,
      barcode: json['barcode'] as String?,
      productType:
          $enumDecodeNullable(_$ProductTypeEnumMap, json['productType']),
      quantity: json['quantity'] as int?,
      description: json['productDescription'] == null
          ? null
          : ProductDescription.fromJson(
              json['productDescription'] as Map<String, dynamic>),
      name: json['productName'] as String?,
      image: json['avatarURL'] as String?,
      storageCodes: (json['storageCodes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      unitId: json['unitId'] as int? ?? 0,
    );

Map<String, dynamic> _$PickProductToJson(PickProduct instance) =>
    <String, dynamic>{
      'productBarcodeId': instance.productBarcodeId,
      'barcode': instance.barcode,
      'productType': _$ProductTypeEnumMap[instance.productType],
      'quantity': instance.quantity,
      'productDescription': instance.description,
      'productName': instance.name,
      'avatarURL': instance.image,
      'storageCodes': instance.storageCodes,
      'unitId': instance.unitId,
    };

const _$ProductTypeEnumMap = {
  ProductType.serial: 1,
  ProductType.nonSerial: 2,
  ProductType.cargo: 3,
};
