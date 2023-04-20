// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_count_remove_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CycleCountRemovePayloadCWProxy {
  CycleCountRemovePayload productBarcodeId(int? productBarcodeId);

  CycleCountRemovePayload storageCodes(List<String> storageCodes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountRemovePayload(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountRemovePayload(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountRemovePayload call({
    int? productBarcodeId,
    List<String>? storageCodes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCycleCountRemovePayload.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCycleCountRemovePayload.copyWith.fieldName(...)`
class _$CycleCountRemovePayloadCWProxyImpl
    implements _$CycleCountRemovePayloadCWProxy {
  final CycleCountRemovePayload _value;

  const _$CycleCountRemovePayloadCWProxyImpl(this._value);

  @override
  CycleCountRemovePayload productBarcodeId(int? productBarcodeId) =>
      this(productBarcodeId: productBarcodeId);

  @override
  CycleCountRemovePayload storageCodes(List<String> storageCodes) =>
      this(storageCodes: storageCodes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountRemovePayload(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountRemovePayload(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountRemovePayload call({
    Object? productBarcodeId = const $CopyWithPlaceholder(),
    Object? storageCodes = const $CopyWithPlaceholder(),
  }) {
    return CycleCountRemovePayload(
      productBarcodeId: productBarcodeId == const $CopyWithPlaceholder()
          ? _value.productBarcodeId
          // ignore: cast_nullable_to_non_nullable
          : productBarcodeId as int?,
      storageCodes:
          storageCodes == const $CopyWithPlaceholder() || storageCodes == null
              ? _value.storageCodes
              // ignore: cast_nullable_to_non_nullable
              : storageCodes as List<String>,
    );
  }
}

extension $CycleCountRemovePayloadCopyWith on CycleCountRemovePayload {
  /// Returns a callable class that can be used as follows: `instanceOfCycleCountRemovePayload.copyWith(...)` or like so:`instanceOfCycleCountRemovePayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CycleCountRemovePayloadCWProxy get copyWith =>
      _$CycleCountRemovePayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CycleCountRemovePayload _$CycleCountRemovePayloadFromJson(
        Map<String, dynamic> json) =>
    CycleCountRemovePayload(
      productBarcodeId: json['productBarcodeId'] as int?,
      storageCodes: (json['storageCodes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CycleCountRemovePayloadToJson(
        CycleCountRemovePayload instance) =>
    <String, dynamic>{
      'productBarcodeId': instance.productBarcodeId,
      'storageCodes': instance.storageCodes,
    };
