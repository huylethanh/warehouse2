// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_count_location.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CycleCountLocationCWProxy {
  CycleCountLocation cycleCountId(int? cycleCountId);

  CycleCountLocation cycleCountLocationId(int? cycleCountLocationId);

  CycleCountLocation locationCode(String? locationCode);

  CycleCountLocation totalCountingQty(int totalCountingQty);

  CycleCountLocation totalDifferentQty(int totalDifferentQty);

  CycleCountLocation totalQty(int totalQty);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountLocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountLocation(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountLocation call({
    int? cycleCountId,
    int? cycleCountLocationId,
    String? locationCode,
    int? totalCountingQty,
    int? totalDifferentQty,
    int? totalQty,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCycleCountLocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCycleCountLocation.copyWith.fieldName(...)`
class _$CycleCountLocationCWProxyImpl implements _$CycleCountLocationCWProxy {
  final CycleCountLocation _value;

  const _$CycleCountLocationCWProxyImpl(this._value);

  @override
  CycleCountLocation cycleCountId(int? cycleCountId) =>
      this(cycleCountId: cycleCountId);

  @override
  CycleCountLocation cycleCountLocationId(int? cycleCountLocationId) =>
      this(cycleCountLocationId: cycleCountLocationId);

  @override
  CycleCountLocation locationCode(String? locationCode) =>
      this(locationCode: locationCode);

  @override
  CycleCountLocation totalCountingQty(int totalCountingQty) =>
      this(totalCountingQty: totalCountingQty);

  @override
  CycleCountLocation totalDifferentQty(int totalDifferentQty) =>
      this(totalDifferentQty: totalDifferentQty);

  @override
  CycleCountLocation totalQty(int totalQty) => this(totalQty: totalQty);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CycleCountLocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CycleCountLocation(...).copyWith(id: 12, name: "My name")
  /// ````
  CycleCountLocation call({
    Object? cycleCountId = const $CopyWithPlaceholder(),
    Object? cycleCountLocationId = const $CopyWithPlaceholder(),
    Object? locationCode = const $CopyWithPlaceholder(),
    Object? totalCountingQty = const $CopyWithPlaceholder(),
    Object? totalDifferentQty = const $CopyWithPlaceholder(),
    Object? totalQty = const $CopyWithPlaceholder(),
  }) {
    return CycleCountLocation(
      cycleCountId: cycleCountId == const $CopyWithPlaceholder()
          ? _value.cycleCountId
          // ignore: cast_nullable_to_non_nullable
          : cycleCountId as int?,
      cycleCountLocationId: cycleCountLocationId == const $CopyWithPlaceholder()
          ? _value.cycleCountLocationId
          // ignore: cast_nullable_to_non_nullable
          : cycleCountLocationId as int?,
      locationCode: locationCode == const $CopyWithPlaceholder()
          ? _value.locationCode
          // ignore: cast_nullable_to_non_nullable
          : locationCode as String?,
      totalCountingQty: totalCountingQty == const $CopyWithPlaceholder() ||
              totalCountingQty == null
          ? _value.totalCountingQty
          // ignore: cast_nullable_to_non_nullable
          : totalCountingQty as int,
      totalDifferentQty: totalDifferentQty == const $CopyWithPlaceholder() ||
              totalDifferentQty == null
          ? _value.totalDifferentQty
          // ignore: cast_nullable_to_non_nullable
          : totalDifferentQty as int,
      totalQty: totalQty == const $CopyWithPlaceholder() || totalQty == null
          ? _value.totalQty
          // ignore: cast_nullable_to_non_nullable
          : totalQty as int,
    );
  }
}

extension $CycleCountLocationCopyWith on CycleCountLocation {
  /// Returns a callable class that can be used as follows: `instanceOfCycleCountLocation.copyWith(...)` or like so:`instanceOfCycleCountLocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CycleCountLocationCWProxy get copyWith =>
      _$CycleCountLocationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CycleCountLocation _$CycleCountLocationFromJson(Map<String, dynamic> json) =>
    CycleCountLocation(
      cycleCountId: json['cycleCountId'] as int?,
      cycleCountLocationId: json['cycleCountLocationId'] as int?,
      locationCode: json['locationCode'] as String?,
      totalQty: json['totalQty'] as int? ?? 0,
      totalCountingQty: json['totalCountingQty'] as int? ?? 0,
      totalDifferentQty: json['totalDifferentQty'] as int? ?? 0,
    );

Map<String, dynamic> _$CycleCountLocationToJson(CycleCountLocation instance) =>
    <String, dynamic>{
      'cycleCountId': instance.cycleCountId,
      'cycleCountLocationId': instance.cycleCountLocationId,
      'locationCode': instance.locationCode,
      'totalQty': instance.totalQty,
      'totalCountingQty': instance.totalCountingQty,
      'totalDifferentQty': instance.totalDifferentQty,
    };
