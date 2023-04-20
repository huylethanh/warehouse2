// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_count_session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CycleCountSessionCWProxy {
  CycleCountSession countingSessionId(int? countingSessionId);

  CycleCountSession cycleCountId(int? cycleCountId);

  CycleCountSession details(List<CycleCountProduct>? details);

  CycleCountSession locationCode(String? locationCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountSession(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountSession call({
    int? countingSessionId,
    int? cycleCountId,
    List<CycleCountProduct>? details,
    String? locationCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCycleCountSession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCycleCountSession.copyWith.fieldName(...)`
class _$CycleCountSessionCWProxyImpl implements _$CycleCountSessionCWProxy {
  final CycleCountSession _value;

  const _$CycleCountSessionCWProxyImpl(this._value);

  @override
  CycleCountSession countingSessionId(int? countingSessionId) =>
      this(countingSessionId: countingSessionId);

  @override
  CycleCountSession cycleCountId(int? cycleCountId) =>
      this(cycleCountId: cycleCountId);

  @override
  CycleCountSession details(List<CycleCountProduct>? details) =>
      this(details: details);

  @override
  CycleCountSession locationCode(String? locationCode) =>
      this(locationCode: locationCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountSession(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountSession call({
    Object? countingSessionId = const $CopyWithPlaceholder(),
    Object? cycleCountId = const $CopyWithPlaceholder(),
    Object? details = const $CopyWithPlaceholder(),
    Object? locationCode = const $CopyWithPlaceholder(),
  }) {
    return CycleCountSession(
      countingSessionId: countingSessionId == const $CopyWithPlaceholder()
          ? _value.countingSessionId
          // ignore: cast_nullable_to_non_nullable
          : countingSessionId as int?,
      cycleCountId: cycleCountId == const $CopyWithPlaceholder()
          ? _value.cycleCountId
          // ignore: cast_nullable_to_non_nullable
          : cycleCountId as int?,
      details: details == const $CopyWithPlaceholder()
          ? _value.details
          // ignore: cast_nullable_to_non_nullable
          : details as List<CycleCountProduct>?,
      locationCode: locationCode == const $CopyWithPlaceholder()
          ? _value.locationCode
          // ignore: cast_nullable_to_non_nullable
          : locationCode as String?,
    );
  }
}

extension $CycleCountSessionCopyWith on CycleCountSession {
  /// Returns a callable class that can be used as follows: `instanceOfCycleCountSession.copyWith(...)` or like so:`instanceOfCycleCountSession.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CycleCountSessionCWProxy get copyWith =>
      _$CycleCountSessionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CycleCountSession _$CycleCountSessionFromJson(Map<String, dynamic> json) =>
    CycleCountSession(
      cycleCountId: json['cycleCountId'] as int?,
      countingSessionId: json['countingSessionId'] as int?,
      locationCode: json['locationCode'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => CycleCountProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CycleCountSessionToJson(CycleCountSession instance) =>
    <String, dynamic>{
      'cycleCountId': instance.cycleCountId,
      'countingSessionId': instance.countingSessionId,
      'locationCode': instance.locationCode,
      'details': instance.details,
    };
