// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_count_session_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CycleCountSessionResponseCWProxy {
  CycleCountSessionResponse countingSessionId(int? countingSessionId);

  CycleCountSessionResponse cycleCountCode(String? cycleCountCode);

  CycleCountSessionResponse cycleCountId(int? cycleCountId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountSessionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountSessionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountSessionResponse call({
    int? countingSessionId,
    String? cycleCountCode,
    int? cycleCountId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCycleCountSessionResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCycleCountSessionResponse.copyWith.fieldName(...)`
class _$CycleCountSessionResponseCWProxyImpl
    implements _$CycleCountSessionResponseCWProxy {
  final CycleCountSessionResponse _value;

  const _$CycleCountSessionResponseCWProxyImpl(this._value);

  @override
  CycleCountSessionResponse countingSessionId(int? countingSessionId) =>
      this(countingSessionId: countingSessionId);

  @override
  CycleCountSessionResponse cycleCountCode(String? cycleCountCode) =>
      this(cycleCountCode: cycleCountCode);

  @override
  CycleCountSessionResponse cycleCountId(int? cycleCountId) =>
      this(cycleCountId: cycleCountId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountSessionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountSessionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountSessionResponse call({
    Object? countingSessionId = const $CopyWithPlaceholder(),
    Object? cycleCountCode = const $CopyWithPlaceholder(),
    Object? cycleCountId = const $CopyWithPlaceholder(),
  }) {
    return CycleCountSessionResponse(
      countingSessionId: countingSessionId == const $CopyWithPlaceholder()
          ? _value.countingSessionId
          // ignore: cast_nullable_to_non_nullable
          : countingSessionId as int?,
      cycleCountCode: cycleCountCode == const $CopyWithPlaceholder()
          ? _value.cycleCountCode
          // ignore: cast_nullable_to_non_nullable
          : cycleCountCode as String?,
      cycleCountId: cycleCountId == const $CopyWithPlaceholder()
          ? _value.cycleCountId
          // ignore: cast_nullable_to_non_nullable
          : cycleCountId as int?,
    );
  }
}

extension $CycleCountSessionResponseCopyWith on CycleCountSessionResponse {
  /// Returns a callable class that can be used as follows: `instanceOfCycleCountSessionResponse.copyWith(...)` or like so:`instanceOfCycleCountSessionResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CycleCountSessionResponseCWProxy get copyWith =>
      _$CycleCountSessionResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CycleCountSessionResponse _$CycleCountSessionResponseFromJson(
        Map<String, dynamic> json) =>
    CycleCountSessionResponse(
      cycleCountId: json['cycleCountId'] as int?,
      cycleCountCode: json['cycleCountCode'] as String?,
      countingSessionId: json['countingSessionId'] as int?,
    );

Map<String, dynamic> _$CycleCountSessionResponseToJson(
        CycleCountSessionResponse instance) =>
    <String, dynamic>{
      'cycleCountId': instance.cycleCountId,
      'cycleCountCode': instance.cycleCountCode,
      'countingSessionId': instance.countingSessionId,
    };
