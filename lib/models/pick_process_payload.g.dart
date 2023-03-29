// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_process_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PickProcessPayloadCWProxy {
  PickProcessPayload binLocationId(int? binLocationId);

  PickProcessPayload isRepick(bool? isRepick);

  PickProcessPayload pickListId(int? pickListId);

  PickProcessPayload pickSessionId(int? pickSessionId);

  PickProcessPayload pickUpLocationId(int? pickUpLocationId);

  PickProcessPayload qty(int? qty);

  PickProcessPayload storageCode(String? storageCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickProcessPayload(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickProcessPayload(...).copyWith(id: 12, name: "My name")
  /// ````
  PickProcessPayload call({
    int? binLocationId,
    bool? isRepick,
    int? pickListId,
    int? pickSessionId,
    int? pickUpLocationId,
    int? qty,
    String? storageCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPickProcessPayload.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPickProcessPayload.copyWith.fieldName(...)`
class _$PickProcessPayloadCWProxyImpl implements _$PickProcessPayloadCWProxy {
  final PickProcessPayload _value;

  const _$PickProcessPayloadCWProxyImpl(this._value);

  @override
  PickProcessPayload binLocationId(int? binLocationId) =>
      this(binLocationId: binLocationId);

  @override
  PickProcessPayload isRepick(bool? isRepick) => this(isRepick: isRepick);

  @override
  PickProcessPayload pickListId(int? pickListId) =>
      this(pickListId: pickListId);

  @override
  PickProcessPayload pickSessionId(int? pickSessionId) =>
      this(pickSessionId: pickSessionId);

  @override
  PickProcessPayload pickUpLocationId(int? pickUpLocationId) =>
      this(pickUpLocationId: pickUpLocationId);

  @override
  PickProcessPayload qty(int? qty) => this(qty: qty);

  @override
  PickProcessPayload storageCode(String? storageCode) =>
      this(storageCode: storageCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickProcessPayload(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickProcessPayload(...).copyWith(id: 12, name: "My name")
  /// ````
  PickProcessPayload call({
    Object? binLocationId = const $CopyWithPlaceholder(),
    Object? isRepick = const $CopyWithPlaceholder(),
    Object? pickListId = const $CopyWithPlaceholder(),
    Object? pickSessionId = const $CopyWithPlaceholder(),
    Object? pickUpLocationId = const $CopyWithPlaceholder(),
    Object? qty = const $CopyWithPlaceholder(),
    Object? storageCode = const $CopyWithPlaceholder(),
  }) {
    return PickProcessPayload(
      binLocationId: binLocationId == const $CopyWithPlaceholder()
          ? _value.binLocationId
          // ignore: cast_nullable_to_non_nullable
          : binLocationId as int?,
      isRepick: isRepick == const $CopyWithPlaceholder()
          ? _value.isRepick
          // ignore: cast_nullable_to_non_nullable
          : isRepick as bool?,
      pickListId: pickListId == const $CopyWithPlaceholder()
          ? _value.pickListId
          // ignore: cast_nullable_to_non_nullable
          : pickListId as int?,
      pickSessionId: pickSessionId == const $CopyWithPlaceholder()
          ? _value.pickSessionId
          // ignore: cast_nullable_to_non_nullable
          : pickSessionId as int?,
      pickUpLocationId: pickUpLocationId == const $CopyWithPlaceholder()
          ? _value.pickUpLocationId
          // ignore: cast_nullable_to_non_nullable
          : pickUpLocationId as int?,
      qty: qty == const $CopyWithPlaceholder()
          ? _value.qty
          // ignore: cast_nullable_to_non_nullable
          : qty as int?,
      storageCode: storageCode == const $CopyWithPlaceholder()
          ? _value.storageCode
          // ignore: cast_nullable_to_non_nullable
          : storageCode as String?,
    );
  }
}

extension $PickProcessPayloadCopyWith on PickProcessPayload {
  /// Returns a callable class that can be used as follows: `instanceOfPickProcessPayload.copyWith(...)` or like so:`instanceOfPickProcessPayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PickProcessPayloadCWProxy get copyWith =>
      _$PickProcessPayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickProcessPayload _$PickProcessPayloadFromJson(Map<String, dynamic> json) =>
    PickProcessPayload(
      pickListId: json['pickListId'] as int?,
      pickSessionId: json['pickSessionId'] as int?,
      binLocationId: json['binLocationId'] as int?,
      pickUpLocationId: json['pickUpLocationId'] as int?,
      qty: json['qty'] as int?,
      storageCode: json['storageCode'] as String?,
      isRepick: json['isRepick'] as bool? ?? false,
    );

Map<String, dynamic> _$PickProcessPayloadToJson(PickProcessPayload instance) =>
    <String, dynamic>{
      'pickListId': instance.pickListId,
      'pickSessionId': instance.pickSessionId,
      'binLocationId': instance.binLocationId,
      'pickUpLocationId': instance.pickUpLocationId,
      'qty': instance.qty,
      'storageCode': instance.storageCode,
      'isRepick': instance.isRepick,
    };
