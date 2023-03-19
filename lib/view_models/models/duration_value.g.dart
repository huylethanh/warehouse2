// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_value.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DurationValueCWProxy {
  DurationValue bestUseD(DateTime? bestUseD);

  DurationValue expireDate(DateTime? expireDate);

  DurationValue issueDate(DateTime? issueDate);

  DurationValue lotNumber(String? lotNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DurationValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DurationValue(...).copyWith(id: 12, name: "My name")
  /// ````
  DurationValue call({
    DateTime? bestUseD,
    DateTime? expireDate,
    DateTime? issueDate,
    String? lotNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDurationValue.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDurationValue.copyWith.fieldName(...)`
class _$DurationValueCWProxyImpl implements _$DurationValueCWProxy {
  final DurationValue _value;

  const _$DurationValueCWProxyImpl(this._value);

  @override
  DurationValue bestUseD(DateTime? bestUseD) => this(bestUseD: bestUseD);

  @override
  DurationValue expireDate(DateTime? expireDate) =>
      this(expireDate: expireDate);

  @override
  DurationValue issueDate(DateTime? issueDate) => this(issueDate: issueDate);

  @override
  DurationValue lotNumber(String? lotNumber) => this(lotNumber: lotNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DurationValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DurationValue(...).copyWith(id: 12, name: "My name")
  /// ````
  DurationValue call({
    Object? bestUseD = const $CopyWithPlaceholder(),
    Object? expireDate = const $CopyWithPlaceholder(),
    Object? issueDate = const $CopyWithPlaceholder(),
    Object? lotNumber = const $CopyWithPlaceholder(),
  }) {
    return DurationValue(
      bestUseD: bestUseD == const $CopyWithPlaceholder()
          ? _value.bestUseD
          // ignore: cast_nullable_to_non_nullable
          : bestUseD as DateTime?,
      expireDate: expireDate == const $CopyWithPlaceholder()
          ? _value.expireDate
          // ignore: cast_nullable_to_non_nullable
          : expireDate as DateTime?,
      issueDate: issueDate == const $CopyWithPlaceholder()
          ? _value.issueDate
          // ignore: cast_nullable_to_non_nullable
          : issueDate as DateTime?,
      lotNumber: lotNumber == const $CopyWithPlaceholder()
          ? _value.lotNumber
          // ignore: cast_nullable_to_non_nullable
          : lotNumber as String?,
    );
  }
}

extension $DurationValueCopyWith on DurationValue {
  /// Returns a callable class that can be used as follows: `instanceOfDurationValue.copyWith(...)` or like so:`instanceOfDurationValue.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DurationValueCWProxy get copyWith => _$DurationValueCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DurationValue _$DurationValueFromJson(Map<String, dynamic> json) =>
    DurationValue(
      issueDate: json['issueDate'] == null
          ? null
          : DateTime.parse(json['issueDate'] as String),
      expireDate: json['expireDate'] == null
          ? null
          : DateTime.parse(json['expireDate'] as String),
      bestUseD: json['bestUseD'] == null
          ? null
          : DateTime.parse(json['bestUseD'] as String),
      lotNumber: json['lotNumber'] as String?,
    );

Map<String, dynamic> _$DurationValueToJson(DurationValue instance) =>
    <String, dynamic>{
      'issueDate': instance.issueDate?.toIso8601String(),
      'expireDate': instance.expireDate?.toIso8601String(),
      'bestUseD': instance.bestUseD?.toIso8601String(),
      'lotNumber': instance.lotNumber,
    };
