// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_value.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DurationValueCWProxy {
  DurationValue expireDate(DateTime? expireDate);

  DurationValue issueDate(DateTime? issueDate);

  DurationValue lotNumber(String? lotNumber);

  DurationValue lotNumberPass(String? lotNumberPass);

  DurationValue numOfExpiry(int? numOfExpiry);

  DurationValue unitExpiry(String? unitExpiry);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DurationValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DurationValue(...).copyWith(id: 12, name: "My name")
  /// ````
  DurationValue call({
    DateTime? expireDate,
    DateTime? issueDate,
    String? lotNumber,
    String? lotNumberPass,
    int? numOfExpiry,
    String? unitExpiry,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDurationValue.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDurationValue.copyWith.fieldName(...)`
class _$DurationValueCWProxyImpl implements _$DurationValueCWProxy {
  final DurationValue _value;

  const _$DurationValueCWProxyImpl(this._value);

  @override
  DurationValue expireDate(DateTime? expireDate) =>
      this(expireDate: expireDate);

  @override
  DurationValue issueDate(DateTime? issueDate) => this(issueDate: issueDate);

  @override
  DurationValue lotNumber(String? lotNumber) => this(lotNumber: lotNumber);

  @override
  DurationValue lotNumberPass(String? lotNumberPass) =>
      this(lotNumberPass: lotNumberPass);

  @override
  DurationValue numOfExpiry(int? numOfExpiry) => this(numOfExpiry: numOfExpiry);

  @override
  DurationValue unitExpiry(String? unitExpiry) => this(unitExpiry: unitExpiry);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DurationValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DurationValue(...).copyWith(id: 12, name: "My name")
  /// ````
  DurationValue call({
    Object? expireDate = const $CopyWithPlaceholder(),
    Object? issueDate = const $CopyWithPlaceholder(),
    Object? lotNumber = const $CopyWithPlaceholder(),
    Object? lotNumberPass = const $CopyWithPlaceholder(),
    Object? numOfExpiry = const $CopyWithPlaceholder(),
    Object? unitExpiry = const $CopyWithPlaceholder(),
  }) {
    return DurationValue(
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
      lotNumberPass: lotNumberPass == const $CopyWithPlaceholder()
          ? _value.lotNumberPass
          // ignore: cast_nullable_to_non_nullable
          : lotNumberPass as String?,
      numOfExpiry: numOfExpiry == const $CopyWithPlaceholder()
          ? _value.numOfExpiry
          // ignore: cast_nullable_to_non_nullable
          : numOfExpiry as int?,
      unitExpiry: unitExpiry == const $CopyWithPlaceholder()
          ? _value.unitExpiry
          // ignore: cast_nullable_to_non_nullable
          : unitExpiry as String?,
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
      lotNumberPass: json['lotNumberPass'] as String?,
      lotNumber: json['lotNumber'] as String?,
      numOfExpiry: json['numOfExpiry'] as int?,
      unitExpiry: json['unitExpiry'] as String?,
    );

Map<String, dynamic> _$DurationValueToJson(DurationValue instance) =>
    <String, dynamic>{
      'issueDate': instance.issueDate?.toIso8601String(),
      'expireDate': instance.expireDate?.toIso8601String(),
      'lotNumber': instance.lotNumber,
      'lotNumberPass': instance.lotNumberPass,
      'numOfExpiry': instance.numOfExpiry,
      'unitExpiry': instance.unitExpiry,
    };
