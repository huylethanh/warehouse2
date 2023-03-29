// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_picking_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FinishPickingPayloadCWProxy {
  FinishPickingPayload pickListId(int? pickListId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FinishPickingPayload(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FinishPickingPayload(...).copyWith(id: 12, name: "My name")
  /// ````
  FinishPickingPayload call({
    int? pickListId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFinishPickingPayload.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFinishPickingPayload.copyWith.fieldName(...)`
class _$FinishPickingPayloadCWProxyImpl
    implements _$FinishPickingPayloadCWProxy {
  final FinishPickingPayload _value;

  const _$FinishPickingPayloadCWProxyImpl(this._value);

  @override
  FinishPickingPayload pickListId(int? pickListId) =>
      this(pickListId: pickListId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FinishPickingPayload(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FinishPickingPayload(...).copyWith(id: 12, name: "My name")
  /// ````
  FinishPickingPayload call({
    Object? pickListId = const $CopyWithPlaceholder(),
  }) {
    return FinishPickingPayload(
      pickListId: pickListId == const $CopyWithPlaceholder()
          ? _value.pickListId
          // ignore: cast_nullable_to_non_nullable
          : pickListId as int?,
    );
  }
}

extension $FinishPickingPayloadCopyWith on FinishPickingPayload {
  /// Returns a callable class that can be used as follows: `instanceOfFinishPickingPayload.copyWith(...)` or like so:`instanceOfFinishPickingPayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FinishPickingPayloadCWProxy get copyWith =>
      _$FinishPickingPayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishPickingPayload _$FinishPickingPayloadFromJson(
        Map<String, dynamic> json) =>
    FinishPickingPayload(
      pickListId: json['pickListId'] as int?,
    );

Map<String, dynamic> _$FinishPickingPayloadToJson(
        FinishPickingPayload instance) =>
    <String, dynamic>{
      'pickListId': instance.pickListId,
    };
