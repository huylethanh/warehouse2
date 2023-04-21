// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_cycle_count.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PartnerCycleCountCWProxy {
  PartnerCycleCount createdDate(String? createdDate);

  PartnerCycleCount cycleCountCode(String? cycleCountCode);

  PartnerCycleCount cycleCountId(int? cycleCountId);

  PartnerCycleCount cycleCountLocations(
      List<CycleCountLocation>? cycleCountLocations);

  PartnerCycleCount cycleCountType(int? cycleCountType);

  PartnerCycleCount partnerCode(String? partnerCode);

  PartnerCycleCount partnerName(String? partnerName);

  PartnerCycleCount totalProduct(int? totalProduct);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PartnerCycleCount(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PartnerCycleCount(...).copyWith(id: 12, name: "My name")
  /// ````
  PartnerCycleCount call({
    String? createdDate,
    String? cycleCountCode,
    int? cycleCountId,
    List<CycleCountLocation>? cycleCountLocations,
    int? cycleCountType,
    String? partnerCode,
    String? partnerName,
    int? totalProduct,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPartnerCycleCount.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPartnerCycleCount.copyWith.fieldName(...)`
class _$PartnerCycleCountCWProxyImpl implements _$PartnerCycleCountCWProxy {
  final PartnerCycleCount _value;

  const _$PartnerCycleCountCWProxyImpl(this._value);

  @override
  PartnerCycleCount createdDate(String? createdDate) =>
      this(createdDate: createdDate);

  @override
  PartnerCycleCount cycleCountCode(String? cycleCountCode) =>
      this(cycleCountCode: cycleCountCode);

  @override
  PartnerCycleCount cycleCountId(int? cycleCountId) =>
      this(cycleCountId: cycleCountId);

  @override
  PartnerCycleCount cycleCountLocations(
          List<CycleCountLocation>? cycleCountLocations) =>
      this(cycleCountLocations: cycleCountLocations);

  @override
  PartnerCycleCount cycleCountType(int? cycleCountType) =>
      this(cycleCountType: cycleCountType);

  @override
  PartnerCycleCount partnerCode(String? partnerCode) =>
      this(partnerCode: partnerCode);

  @override
  PartnerCycleCount partnerName(String? partnerName) =>
      this(partnerName: partnerName);

  @override
  PartnerCycleCount totalProduct(int? totalProduct) =>
      this(totalProduct: totalProduct);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PartnerCycleCount(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PartnerCycleCount(...).copyWith(id: 12, name: "My name")
  /// ````
  PartnerCycleCount call({
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? cycleCountCode = const $CopyWithPlaceholder(),
    Object? cycleCountId = const $CopyWithPlaceholder(),
    Object? cycleCountLocations = const $CopyWithPlaceholder(),
    Object? cycleCountType = const $CopyWithPlaceholder(),
    Object? partnerCode = const $CopyWithPlaceholder(),
    Object? partnerName = const $CopyWithPlaceholder(),
    Object? totalProduct = const $CopyWithPlaceholder(),
  }) {
    return PartnerCycleCount(
      createdDate: createdDate == const $CopyWithPlaceholder()
          ? _value.createdDate
          // ignore: cast_nullable_to_non_nullable
          : createdDate as String?,
      cycleCountCode: cycleCountCode == const $CopyWithPlaceholder()
          ? _value.cycleCountCode
          // ignore: cast_nullable_to_non_nullable
          : cycleCountCode as String?,
      cycleCountId: cycleCountId == const $CopyWithPlaceholder()
          ? _value.cycleCountId
          // ignore: cast_nullable_to_non_nullable
          : cycleCountId as int?,
      cycleCountLocations: cycleCountLocations == const $CopyWithPlaceholder()
          ? _value.cycleCountLocations
          // ignore: cast_nullable_to_non_nullable
          : cycleCountLocations as List<CycleCountLocation>?,
      cycleCountType: cycleCountType == const $CopyWithPlaceholder()
          ? _value.cycleCountType
          // ignore: cast_nullable_to_non_nullable
          : cycleCountType as int?,
      partnerCode: partnerCode == const $CopyWithPlaceholder()
          ? _value.partnerCode
          // ignore: cast_nullable_to_non_nullable
          : partnerCode as String?,
      partnerName: partnerName == const $CopyWithPlaceholder()
          ? _value.partnerName
          // ignore: cast_nullable_to_non_nullable
          : partnerName as String?,
      totalProduct: totalProduct == const $CopyWithPlaceholder()
          ? _value.totalProduct
          // ignore: cast_nullable_to_non_nullable
          : totalProduct as int?,
    );
  }
}

extension $PartnerCycleCountCopyWith on PartnerCycleCount {
  /// Returns a callable class that can be used as follows: `instanceOfPartnerCycleCount.copyWith(...)` or like so:`instanceOfPartnerCycleCount.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PartnerCycleCountCWProxy get copyWith =>
      _$PartnerCycleCountCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerCycleCount _$PartnerCycleCountFromJson(Map<String, dynamic> json) =>
    PartnerCycleCount(
      cycleCountId: json['cycleCountId'] as int?,
      cycleCountCode: json['cycleCountCode'] as String?,
      cycleCountType: json['cycleCountType'] as int?,
      partnerCode: json['partnerCode'] as String?,
      partnerName: json['partnerName'] as String?,
      totalProduct: json['totalProduct'] as int?,
      createdDate: json['createdDate'] as String?,
      cycleCountLocations: (json['cycleCountLocations'] as List<dynamic>?)
          ?.map((e) => CycleCountLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PartnerCycleCountToJson(PartnerCycleCount instance) =>
    <String, dynamic>{
      'cycleCountId': instance.cycleCountId,
      'cycleCountCode': instance.cycleCountCode,
      'cycleCountType': instance.cycleCountType,
      'partnerCode': instance.partnerCode,
      'partnerName': instance.partnerName,
      'totalProduct': instance.totalProduct,
      'createdDate': instance.createdDate,
      'cycleCountLocations': instance.cycleCountLocations,
    };
