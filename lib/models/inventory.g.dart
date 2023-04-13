// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InventoryCWProxy {
  Inventory currentNumberSKU(int? currentNumberSKU);

  Inventory items(List<StoringProduct>? items);

  Inventory locationCode(String? locationCode);

  Inventory maxNumberSKU(int? maxNumberSKU);

  Inventory physicalType(String? physicalType);

  Inventory status(String? status);

  Inventory updatedBy(int? updatedBy);

  Inventory updatedByName(String? updatedByName);

  Inventory updatedDate(String? updatedDate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Inventory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Inventory(...).copyWith(id: 12, name: "My name")
  /// ````
  Inventory call({
    int? currentNumberSKU,
    List<StoringProduct>? items,
    String? locationCode,
    int? maxNumberSKU,
    String? physicalType,
    String? status,
    int? updatedBy,
    String? updatedByName,
    String? updatedDate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInventory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInventory.copyWith.fieldName(...)`
class _$InventoryCWProxyImpl implements _$InventoryCWProxy {
  final Inventory _value;

  const _$InventoryCWProxyImpl(this._value);

  @override
  Inventory currentNumberSKU(int? currentNumberSKU) =>
      this(currentNumberSKU: currentNumberSKU);

  @override
  Inventory items(List<StoringProduct>? items) => this(items: items);

  @override
  Inventory locationCode(String? locationCode) =>
      this(locationCode: locationCode);

  @override
  Inventory maxNumberSKU(int? maxNumberSKU) => this(maxNumberSKU: maxNumberSKU);

  @override
  Inventory physicalType(String? physicalType) =>
      this(physicalType: physicalType);

  @override
  Inventory status(String? status) => this(status: status);

  @override
  Inventory updatedBy(int? updatedBy) => this(updatedBy: updatedBy);

  @override
  Inventory updatedByName(String? updatedByName) =>
      this(updatedByName: updatedByName);

  @override
  Inventory updatedDate(String? updatedDate) => this(updatedDate: updatedDate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Inventory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Inventory(...).copyWith(id: 12, name: "My name")
  /// ````
  Inventory call({
    Object? currentNumberSKU = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? locationCode = const $CopyWithPlaceholder(),
    Object? maxNumberSKU = const $CopyWithPlaceholder(),
    Object? physicalType = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? updatedBy = const $CopyWithPlaceholder(),
    Object? updatedByName = const $CopyWithPlaceholder(),
    Object? updatedDate = const $CopyWithPlaceholder(),
  }) {
    return Inventory(
      currentNumberSKU: currentNumberSKU == const $CopyWithPlaceholder()
          ? _value.currentNumberSKU
          // ignore: cast_nullable_to_non_nullable
          : currentNumberSKU as int?,
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<StoringProduct>?,
      locationCode: locationCode == const $CopyWithPlaceholder()
          ? _value.locationCode
          // ignore: cast_nullable_to_non_nullable
          : locationCode as String?,
      maxNumberSKU: maxNumberSKU == const $CopyWithPlaceholder()
          ? _value.maxNumberSKU
          // ignore: cast_nullable_to_non_nullable
          : maxNumberSKU as int?,
      physicalType: physicalType == const $CopyWithPlaceholder()
          ? _value.physicalType
          // ignore: cast_nullable_to_non_nullable
          : physicalType as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String?,
      updatedBy: updatedBy == const $CopyWithPlaceholder()
          ? _value.updatedBy
          // ignore: cast_nullable_to_non_nullable
          : updatedBy as int?,
      updatedByName: updatedByName == const $CopyWithPlaceholder()
          ? _value.updatedByName
          // ignore: cast_nullable_to_non_nullable
          : updatedByName as String?,
      updatedDate: updatedDate == const $CopyWithPlaceholder()
          ? _value.updatedDate
          // ignore: cast_nullable_to_non_nullable
          : updatedDate as String?,
    );
  }
}

extension $InventoryCopyWith on Inventory {
  /// Returns a callable class that can be used as follows: `instanceOfInventory.copyWith(...)` or like so:`instanceOfInventory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InventoryCWProxy get copyWith => _$InventoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inventory _$InventoryFromJson(Map<String, dynamic> json) => Inventory(
      locationCode: json['locationCode'] as String?,
      status: json['status'] as String?,
      physicalType: json['physicalType'] as String?,
      updatedDate: json['updatedDate'] as String?,
      updatedBy: json['updatedBy'] as int?,
      updatedByName: json['updatedByName'] as String?,
      maxNumberSKU: json['maxNumberSKU'] as int?,
      currentNumberSKU: json['currentNumberSKU'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => StoringProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InventoryToJson(Inventory instance) => <String, dynamic>{
      'locationCode': instance.locationCode,
      'status': instance.status,
      'physicalType': instance.physicalType,
      'updatedDate': instance.updatedDate,
      'updatedBy': instance.updatedBy,
      'updatedByName': instance.updatedByName,
      'maxNumberSKU': instance.maxNumberSKU,
      'currentNumberSKU': instance.currentNumberSKU,
      'items': instance.items,
    };
