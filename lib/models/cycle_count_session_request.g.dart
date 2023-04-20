// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_count_session_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CycleCountSessionRequestCWProxy {
  CycleCountSessionRequest cycleCountId(int cycleCountId);

  CycleCountSessionRequest cycleCountType(int cycleCountType);

  CycleCountSessionRequest locationCode(String locationCode);

  CycleCountSessionRequest roundNumber(int roundNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountSessionRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountSessionRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountSessionRequest call({
    int? cycleCountId,
    int? cycleCountType,
    String? locationCode,
    int? roundNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCycleCountSessionRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCycleCountSessionRequest.copyWith.fieldName(...)`
class _$CycleCountSessionRequestCWProxyImpl
    implements _$CycleCountSessionRequestCWProxy {
  final CycleCountSessionRequest _value;

  const _$CycleCountSessionRequestCWProxyImpl(this._value);

  @override
  CycleCountSessionRequest cycleCountId(int cycleCountId) =>
      this(cycleCountId: cycleCountId);

  @override
  CycleCountSessionRequest cycleCountType(int cycleCountType) =>
      this(cycleCountType: cycleCountType);

  @override
  CycleCountSessionRequest locationCode(String locationCode) =>
      this(locationCode: locationCode);

  @override
  CycleCountSessionRequest roundNumber(int roundNumber) =>
      this(roundNumber: roundNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountSessionRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountSessionRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountSessionRequest call({
    Object? cycleCountId = const $CopyWithPlaceholder(),
    Object? cycleCountType = const $CopyWithPlaceholder(),
    Object? locationCode = const $CopyWithPlaceholder(),
    Object? roundNumber = const $CopyWithPlaceholder(),
  }) {
    return CycleCountSessionRequest(
      cycleCountId:
          cycleCountId == const $CopyWithPlaceholder() || cycleCountId == null
              ? _value.cycleCountId
              // ignore: cast_nullable_to_non_nullable
              : cycleCountId as int,
      cycleCountType: cycleCountType == const $CopyWithPlaceholder() ||
              cycleCountType == null
          ? _value.cycleCountType
          // ignore: cast_nullable_to_non_nullable
          : cycleCountType as int,
      locationCode:
          locationCode == const $CopyWithPlaceholder() || locationCode == null
              ? _value.locationCode
              // ignore: cast_nullable_to_non_nullable
              : locationCode as String,
      roundNumber:
          roundNumber == const $CopyWithPlaceholder() || roundNumber == null
              ? _value.roundNumber
              // ignore: cast_nullable_to_non_nullable
              : roundNumber as int,
    );
  }
}

extension $CycleCountSessionRequestCopyWith on CycleCountSessionRequest {
  /// Returns a callable class that can be used as follows: `instanceOfCycleCountSessionRequest.copyWith(...)` or like so:`instanceOfCycleCountSessionRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CycleCountSessionRequestCWProxy get copyWith =>
      _$CycleCountSessionRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CycleCountSessionRequest _$CycleCountSessionRequestFromJson(
        Map<String, dynamic> json) =>
    CycleCountSessionRequest(
      cycleCountId: json['cycleCountId'] as int,
      locationCode: json['locationCode'] as String,
      cycleCountType: json['cycleCountType'] as int,
      roundNumber: json['roundNumber'] as int,
    );

Map<String, dynamic> _$CycleCountSessionRequestToJson(
        CycleCountSessionRequest instance) =>
    <String, dynamic>{
      'cycleCountId': instance.cycleCountId,
      'locationCode': instance.locationCode,
      'cycleCountType': instance.cycleCountType,
      'roundNumber': instance.roundNumber,
    };
