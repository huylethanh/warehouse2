// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_object.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BarcodeObjectCWProxy {
  BarcodeObject barcode(String? barcode);

  BarcodeObject productBarcodeId(int? productBarcodeId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BarcodeObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BarcodeObject(...).copyWith(id: 12, name: "My name")
  /// ````
  BarcodeObject call({
    String? barcode,
    int? productBarcodeId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBarcodeObject.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBarcodeObject.copyWith.fieldName(...)`
class _$BarcodeObjectCWProxyImpl implements _$BarcodeObjectCWProxy {
  final BarcodeObject _value;

  const _$BarcodeObjectCWProxyImpl(this._value);

  @override
  BarcodeObject barcode(String? barcode) => this(barcode: barcode);

  @override
  BarcodeObject productBarcodeId(int? productBarcodeId) =>
      this(productBarcodeId: productBarcodeId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BarcodeObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BarcodeObject(...).copyWith(id: 12, name: "My name")
  /// ````
  BarcodeObject call({
    Object? barcode = const $CopyWithPlaceholder(),
    Object? productBarcodeId = const $CopyWithPlaceholder(),
  }) {
    return BarcodeObject(
      barcode: barcode == const $CopyWithPlaceholder()
          ? _value.barcode
          // ignore: cast_nullable_to_non_nullable
          : barcode as String?,
      productBarcodeId: productBarcodeId == const $CopyWithPlaceholder()
          ? _value.productBarcodeId
          // ignore: cast_nullable_to_non_nullable
          : productBarcodeId as int?,
    );
  }
}

extension $BarcodeObjectCopyWith on BarcodeObject {
  /// Returns a callable class that can be used as follows: `instanceOfBarcodeObject.copyWith(...)` or like so:`instanceOfBarcodeObject.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BarcodeObjectCWProxy get copyWith => _$BarcodeObjectCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeObject _$BarcodeObjectFromJson(Map<String, dynamic> json) =>
    BarcodeObject(
      productBarcodeId: json['productBarcodeId'] as int?,
      barcode: json['barcode'] as String?,
    );

Map<String, dynamic> _$BarcodeObjectToJson(BarcodeObject instance) =>
    <String, dynamic>{
      'productBarcodeId': instance.productBarcodeId,
      'barcode': instance.barcode,
    };
