// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picking_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PickingItemCWProxy {
  PickingItem locationCode(String? locationCode);

  PickingItem locationId(int? locationId);

  PickingItem locationIndex(int? locationIndex);

  PickingItem productId(int? productId);

  PickingItem quantity(int? quantity);

  PickingItem storageCodes(List<String>? storageCodes);

  PickingItem unitId(int? unitId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickingItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickingItem(...).copyWith(id: 12, name: "My name")
  /// ````
  PickingItem call({
    String? locationCode,
    int? locationId,
    int? locationIndex,
    int? productId,
    int? quantity,
    List<String>? storageCodes,
    int? unitId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPickingItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPickingItem.copyWith.fieldName(...)`
class _$PickingItemCWProxyImpl implements _$PickingItemCWProxy {
  final PickingItem _value;

  const _$PickingItemCWProxyImpl(this._value);

  @override
  PickingItem locationCode(String? locationCode) =>
      this(locationCode: locationCode);

  @override
  PickingItem locationId(int? locationId) => this(locationId: locationId);

  @override
  PickingItem locationIndex(int? locationIndex) =>
      this(locationIndex: locationIndex);

  @override
  PickingItem productId(int? productId) => this(productId: productId);

  @override
  PickingItem quantity(int? quantity) => this(quantity: quantity);

  @override
  PickingItem storageCodes(List<String>? storageCodes) =>
      this(storageCodes: storageCodes);

  @override
  PickingItem unitId(int? unitId) => this(unitId: unitId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickingItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickingItem(...).copyWith(id: 12, name: "My name")
  /// ````
  PickingItem call({
    Object? locationCode = const $CopyWithPlaceholder(),
    Object? locationId = const $CopyWithPlaceholder(),
    Object? locationIndex = const $CopyWithPlaceholder(),
    Object? productId = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? storageCodes = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
  }) {
    return PickingItem(
      locationCode: locationCode == const $CopyWithPlaceholder()
          ? _value.locationCode
          // ignore: cast_nullable_to_non_nullable
          : locationCode as String?,
      locationId: locationId == const $CopyWithPlaceholder()
          ? _value.locationId
          // ignore: cast_nullable_to_non_nullable
          : locationId as int?,
      locationIndex: locationIndex == const $CopyWithPlaceholder()
          ? _value.locationIndex
          // ignore: cast_nullable_to_non_nullable
          : locationIndex as int?,
      productId: productId == const $CopyWithPlaceholder()
          ? _value.productId
          // ignore: cast_nullable_to_non_nullable
          : productId as int?,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int?,
      storageCodes: storageCodes == const $CopyWithPlaceholder()
          ? _value.storageCodes
          // ignore: cast_nullable_to_non_nullable
          : storageCodes as List<String>?,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as int?,
    );
  }
}

extension $PickingItemCopyWith on PickingItem {
  /// Returns a callable class that can be used as follows: `instanceOfPickingItem.copyWith(...)` or like so:`instanceOfPickingItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PickingItemCWProxy get copyWith => _$PickingItemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickingItem _$PickingItemFromJson(Map<String, dynamic> json) => PickingItem(
      locationId: json['pickUpLocationId'] as int?,
      locationCode: json['pickUpLocationCode'] as String?,
      locationIndex: json['pickUpLocationIndex'] as int?,
      productId: json['productBarcodeId'] as int?,
      quantity: json['qty'] as int?,
      unitId: json['unitId'] as int?,
      storageCodes: (json['storageCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PickingItemToJson(PickingItem instance) =>
    <String, dynamic>{
      'pickUpLocationId': instance.locationId,
      'pickUpLocationCode': instance.locationCode,
      'pickUpLocationIndex': instance.locationIndex,
      'productBarcodeId': instance.productId,
      'qty': instance.quantity,
      'unitId': instance.unitId,
      'storageCodes': instance.storageCodes,
    };
