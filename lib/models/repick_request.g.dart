// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repick_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RepickRequestCWProxy {
  RepickRequest locationCode(String? locationCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RepickRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RepickRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  RepickRequest call({
    String? locationCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRepickRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRepickRequest.copyWith.fieldName(...)`
class _$RepickRequestCWProxyImpl implements _$RepickRequestCWProxy {
  final RepickRequest _value;

  const _$RepickRequestCWProxyImpl(this._value);

  @override
  RepickRequest locationCode(String? locationCode) =>
      this(locationCode: locationCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RepickRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RepickRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  RepickRequest call({
    Object? locationCode = const $CopyWithPlaceholder(),
  }) {
    return RepickRequest(
      locationCode: locationCode == const $CopyWithPlaceholder()
          ? _value.locationCode
          // ignore: cast_nullable_to_non_nullable
          : locationCode as String?,
    );
  }
}

extension $RepickRequestCopyWith on RepickRequest {
  /// Returns a callable class that can be used as follows: `instanceOfRepickRequest.copyWith(...)` or like so:`instanceOfRepickRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RepickRequestCWProxy get copyWith => _$RepickRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepickRequest _$RepickRequestFromJson(Map<String, dynamic> json) =>
    RepickRequest(
      locationCode: json['locationCode'] as String?,
    );

Map<String, dynamic> _$RepickRequestToJson(RepickRequest instance) =>
    <String, dynamic>{
      'locationCode': instance.locationCode,
    };
