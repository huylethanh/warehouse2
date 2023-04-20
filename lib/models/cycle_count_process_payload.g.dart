// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_count_process_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CycleCountProcessPayloadCWProxy {
  CycleCountProcessPayload expiredDate(int? expiredDate);

  CycleCountProcessPayload lotNumber(String? lotNumber);

  CycleCountProcessPayload manufactureDate(int? manufactureDate);

  CycleCountProcessPayload numOfExpiry(int? numOfExpiry);

  CycleCountProcessPayload productBarcodeId(int? productBarcodeId);

  CycleCountProcessPayload qty(int qty);

  CycleCountProcessPayload storageCode(String? storageCode);

  CycleCountProcessPayload unitExpiry(String? unitExpiry);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountProcessPayload(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountProcessPayload(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountProcessPayload call({
    int? expiredDate,
    String? lotNumber,
    int? manufactureDate,
    int? numOfExpiry,
    int? productBarcodeId,
    int? qty,
    String? storageCode,
    String? unitExpiry,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCycleCountProcessPayload.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCycleCountProcessPayload.copyWith.fieldName(...)`
class _$CycleCountProcessPayloadCWProxyImpl
    implements _$CycleCountProcessPayloadCWProxy {
  final CycleCountProcessPayload _value;

  const _$CycleCountProcessPayloadCWProxyImpl(this._value);

  @override
  CycleCountProcessPayload expiredDate(int? expiredDate) =>
      this(expiredDate: expiredDate);

  @override
  CycleCountProcessPayload lotNumber(String? lotNumber) =>
      this(lotNumber: lotNumber);

  @override
  CycleCountProcessPayload manufactureDate(int? manufactureDate) =>
      this(manufactureDate: manufactureDate);

  @override
  CycleCountProcessPayload numOfExpiry(int? numOfExpiry) =>
      this(numOfExpiry: numOfExpiry);

  @override
  CycleCountProcessPayload productBarcodeId(int? productBarcodeId) =>
      this(productBarcodeId: productBarcodeId);

  @override
  CycleCountProcessPayload qty(int qty) => this(qty: qty);

  @override
  CycleCountProcessPayload storageCode(String? storageCode) =>
      this(storageCode: storageCode);

  @override
  CycleCountProcessPayload unitExpiry(String? unitExpiry) =>
      this(unitExpiry: unitExpiry);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountProcessPayload(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountProcessPayload(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountProcessPayload call({
    Object? expiredDate = const $CopyWithPlaceholder(),
    Object? lotNumber = const $CopyWithPlaceholder(),
    Object? manufactureDate = const $CopyWithPlaceholder(),
    Object? numOfExpiry = const $CopyWithPlaceholder(),
    Object? productBarcodeId = const $CopyWithPlaceholder(),
    Object? qty = const $CopyWithPlaceholder(),
    Object? storageCode = const $CopyWithPlaceholder(),
    Object? unitExpiry = const $CopyWithPlaceholder(),
  }) {
    return CycleCountProcessPayload(
      expiredDate: expiredDate == const $CopyWithPlaceholder()
          ? _value.expiredDate
          // ignore: cast_nullable_to_non_nullable
          : expiredDate as int?,
      lotNumber: lotNumber == const $CopyWithPlaceholder()
          ? _value.lotNumber
          // ignore: cast_nullable_to_non_nullable
          : lotNumber as String?,
      manufactureDate: manufactureDate == const $CopyWithPlaceholder()
          ? _value.manufactureDate
          // ignore: cast_nullable_to_non_nullable
          : manufactureDate as int?,
      numOfExpiry: numOfExpiry == const $CopyWithPlaceholder()
          ? _value.numOfExpiry
          // ignore: cast_nullable_to_non_nullable
          : numOfExpiry as int?,
      productBarcodeId: productBarcodeId == const $CopyWithPlaceholder()
          ? _value.productBarcodeId
          // ignore: cast_nullable_to_non_nullable
          : productBarcodeId as int?,
      qty: qty == const $CopyWithPlaceholder() || qty == null
          ? _value.qty
          // ignore: cast_nullable_to_non_nullable
          : qty as int,
      storageCode: storageCode == const $CopyWithPlaceholder()
          ? _value.storageCode
          // ignore: cast_nullable_to_non_nullable
          : storageCode as String?,
      unitExpiry: unitExpiry == const $CopyWithPlaceholder()
          ? _value.unitExpiry
          // ignore: cast_nullable_to_non_nullable
          : unitExpiry as String?,
    );
  }
}

extension $CycleCountProcessPayloadCopyWith on CycleCountProcessPayload {
  /// Returns a callable class that can be used as follows: `instanceOfCycleCountProcessPayload.copyWith(...)` or like so:`instanceOfCycleCountProcessPayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CycleCountProcessPayloadCWProxy get copyWith =>
      _$CycleCountProcessPayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CycleCountProcessPayload _$CycleCountProcessPayloadFromJson(
        Map<String, dynamic> json) =>
    CycleCountProcessPayload(
      productBarcodeId: json['productBarcodeId'] as int?,
      storageCode: json['storageCode'] as String?,
      qty: json['qty'] as int? ?? 0,
      lotNumber: json['lotNumber'] as String?,
      expiredDate: json['expiredDate'] as int?,
      manufactureDate: json['manufactureDate'] as int?,
      numOfExpiry: json['numOfExpiry'] as int?,
      unitExpiry: json['unitExpiry'] as String?,
    );

Map<String, dynamic> _$CycleCountProcessPayloadToJson(
        CycleCountProcessPayload instance) =>
    <String, dynamic>{
      'productBarcodeId': instance.productBarcodeId,
      'storageCode': instance.storageCode,
      'qty': instance.qty,
      'lotNumber': instance.lotNumber,
      'expiredDate': instance.expiredDate,
      'manufactureDate': instance.manufactureDate,
      'numOfExpiry': instance.numOfExpiry,
      'unitExpiry': instance.unitExpiry,
    };
