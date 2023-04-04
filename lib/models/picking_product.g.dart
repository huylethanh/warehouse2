// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picking_product.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PickingProductCWProxy {
  PickingProduct productId(int? productId);

  PickingProduct quantity(int? quantity);

  PickingProduct serial(String? serial);

  PickingProduct sku(String? sku);

  PickingProduct typeLabel(String? typeLabel);

  PickingProduct unitId(int? unitId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickingProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickingProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  PickingProduct call({
    int? productId,
    int? quantity,
    String? serial,
    String? sku,
    String? typeLabel,
    int? unitId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPickingProduct.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPickingProduct.copyWith.fieldName(...)`
class _$PickingProductCWProxyImpl implements _$PickingProductCWProxy {
  final PickingProduct _value;

  const _$PickingProductCWProxyImpl(this._value);

  @override
  PickingProduct productId(int? productId) => this(productId: productId);

  @override
  PickingProduct quantity(int? quantity) => this(quantity: quantity);

  @override
  PickingProduct serial(String? serial) => this(serial: serial);

  @override
  PickingProduct sku(String? sku) => this(sku: sku);

  @override
  PickingProduct typeLabel(String? typeLabel) => this(typeLabel: typeLabel);

  @override
  PickingProduct unitId(int? unitId) => this(unitId: unitId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickingProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickingProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  PickingProduct call({
    Object? productId = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? serial = const $CopyWithPlaceholder(),
    Object? sku = const $CopyWithPlaceholder(),
    Object? typeLabel = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
  }) {
    return PickingProduct(
      productId: productId == const $CopyWithPlaceholder()
          ? _value.productId
          // ignore: cast_nullable_to_non_nullable
          : productId as int?,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int?,
      serial: serial == const $CopyWithPlaceholder()
          ? _value.serial
          // ignore: cast_nullable_to_non_nullable
          : serial as String?,
      sku: sku == const $CopyWithPlaceholder()
          ? _value.sku
          // ignore: cast_nullable_to_non_nullable
          : sku as String?,
      typeLabel: typeLabel == const $CopyWithPlaceholder()
          ? _value.typeLabel
          // ignore: cast_nullable_to_non_nullable
          : typeLabel as String?,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as int?,
    );
  }
}

extension $PickingProductCopyWith on PickingProduct {
  /// Returns a callable class that can be used as follows: `instanceOfPickingProduct.copyWith(...)` or like so:`instanceOfPickingProduct.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PickingProductCWProxy get copyWith => _$PickingProductCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickingProduct _$PickingProductFromJson(Map<String, dynamic> json) =>
    PickingProduct(
      productId: json['productId'] as int?,
      sku: json['sku'] as String?,
      quantity: json['qty'] as int?,
      typeLabel: json['typeLabel'] as String?,
      unitId: json['unitId'] as int?,
      serial: json['serial'] as String?,
    );

Map<String, dynamic> _$PickingProductToJson(PickingProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'sku': instance.sku,
      'qty': instance.quantity,
      'typeLabel': instance.typeLabel,
      'unitId': instance.unitId,
      'serial': instance.serial,
    };
