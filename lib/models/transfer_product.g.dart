// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_product.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransferProductCWProxy {
  TransferProduct productId(int? productId);

  TransferProduct serial(String? serial);

  TransferProduct sku(String? sku);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferProduct call({
    int? productId,
    String? serial,
    String? sku,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTransferProduct.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTransferProduct.copyWith.fieldName(...)`
class _$TransferProductCWProxyImpl implements _$TransferProductCWProxy {
  final TransferProduct _value;

  const _$TransferProductCWProxyImpl(this._value);

  @override
  TransferProduct productId(int? productId) => this(productId: productId);

  @override
  TransferProduct serial(String? serial) => this(serial: serial);

  @override
  TransferProduct sku(String? sku) => this(sku: sku);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferProduct call({
    Object? productId = const $CopyWithPlaceholder(),
    Object? serial = const $CopyWithPlaceholder(),
    Object? sku = const $CopyWithPlaceholder(),
  }) {
    return TransferProduct(
      productId: productId == const $CopyWithPlaceholder()
          ? _value.productId
          // ignore: cast_nullable_to_non_nullable
          : productId as int?,
      serial: serial == const $CopyWithPlaceholder()
          ? _value.serial
          // ignore: cast_nullable_to_non_nullable
          : serial as String?,
      sku: sku == const $CopyWithPlaceholder()
          ? _value.sku
          // ignore: cast_nullable_to_non_nullable
          : sku as String?,
    );
  }
}

extension $TransferProductCopyWith on TransferProduct {
  /// Returns a callable class that can be used as follows: `instanceOfTransferProduct.copyWith(...)` or like so:`instanceOfTransferProduct.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TransferProductCWProxy get copyWith => _$TransferProductCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferProduct _$TransferProductFromJson(Map<String, dynamic> json) =>
    TransferProduct(
      productId: json['productId'] as int?,
      sku: json['sku'] as String?,
      serial: json['serial'] as String?,
    );

Map<String, dynamic> _$TransferProductToJson(TransferProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'sku': instance.sku,
      'serial': instance.serial,
    };
