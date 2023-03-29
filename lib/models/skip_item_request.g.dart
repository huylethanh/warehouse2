// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skip_item_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SkipItemRequestCWProxy {
  SkipItemRequest binLocationId(int? binLocationId);

  SkipItemRequest isRepick(bool? isRepick);

  SkipItemRequest pickSessionId(int? pickSessionId);

  SkipItemRequest productBarcodeId(int? productBarcodeId);

  SkipItemRequest storageCode(String? storageCode);

  SkipItemRequest unitId(int? unitId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SkipItemRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SkipItemRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SkipItemRequest call({
    int? binLocationId,
    bool? isRepick,
    int? pickSessionId,
    int? productBarcodeId,
    String? storageCode,
    int? unitId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSkipItemRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSkipItemRequest.copyWith.fieldName(...)`
class _$SkipItemRequestCWProxyImpl implements _$SkipItemRequestCWProxy {
  final SkipItemRequest _value;

  const _$SkipItemRequestCWProxyImpl(this._value);

  @override
  SkipItemRequest binLocationId(int? binLocationId) =>
      this(binLocationId: binLocationId);

  @override
  SkipItemRequest isRepick(bool? isRepick) => this(isRepick: isRepick);

  @override
  SkipItemRequest pickSessionId(int? pickSessionId) =>
      this(pickSessionId: pickSessionId);

  @override
  SkipItemRequest productBarcodeId(int? productBarcodeId) =>
      this(productBarcodeId: productBarcodeId);

  @override
  SkipItemRequest storageCode(String? storageCode) =>
      this(storageCode: storageCode);

  @override
  SkipItemRequest unitId(int? unitId) => this(unitId: unitId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SkipItemRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SkipItemRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SkipItemRequest call({
    Object? binLocationId = const $CopyWithPlaceholder(),
    Object? isRepick = const $CopyWithPlaceholder(),
    Object? pickSessionId = const $CopyWithPlaceholder(),
    Object? productBarcodeId = const $CopyWithPlaceholder(),
    Object? storageCode = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
  }) {
    return SkipItemRequest(
      binLocationId: binLocationId == const $CopyWithPlaceholder()
          ? _value.binLocationId
          // ignore: cast_nullable_to_non_nullable
          : binLocationId as int?,
      isRepick: isRepick == const $CopyWithPlaceholder()
          ? _value.isRepick
          // ignore: cast_nullable_to_non_nullable
          : isRepick as bool?,
      pickSessionId: pickSessionId == const $CopyWithPlaceholder()
          ? _value.pickSessionId
          // ignore: cast_nullable_to_non_nullable
          : pickSessionId as int?,
      productBarcodeId: productBarcodeId == const $CopyWithPlaceholder()
          ? _value.productBarcodeId
          // ignore: cast_nullable_to_non_nullable
          : productBarcodeId as int?,
      storageCode: storageCode == const $CopyWithPlaceholder()
          ? _value.storageCode
          // ignore: cast_nullable_to_non_nullable
          : storageCode as String?,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as int?,
    );
  }
}

extension $SkipItemRequestCopyWith on SkipItemRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSkipItemRequest.copyWith(...)` or like so:`instanceOfSkipItemRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SkipItemRequestCWProxy get copyWith => _$SkipItemRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkipItemRequest _$SkipItemRequestFromJson(Map<String, dynamic> json) =>
    SkipItemRequest(
      pickSessionId: json['pickSessionId'] as int?,
      binLocationId: json['binLocationId'] as int?,
      productBarcodeId: json['productBarcodeId'] as int?,
      unitId: json['unitId'] as int?,
      storageCode: json['storageCode'] as String?,
      isRepick: json['isRepick'] as bool?,
    );

Map<String, dynamic> _$SkipItemRequestToJson(SkipItemRequest instance) =>
    <String, dynamic>{
      'pickSessionId': instance.pickSessionId,
      'binLocationId': instance.binLocationId,
      'productBarcodeId': instance.productBarcodeId,
      'unitId': instance.unitId,
      'storageCode': instance.storageCode,
      'isRepick': instance.isRepick,
    };
