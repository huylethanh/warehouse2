// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_put_away_session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreatePutAwaySessionRequestCWProxy {
  CreatePutAwaySessionRequest locationCode(String? locationCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePutAwaySessionRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePutAwaySessionRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePutAwaySessionRequest call({
    String? locationCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreatePutAwaySessionRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreatePutAwaySessionRequest.copyWith.fieldName(...)`
class _$CreatePutAwaySessionRequestCWProxyImpl
    implements _$CreatePutAwaySessionRequestCWProxy {
  final CreatePutAwaySessionRequest _value;

  const _$CreatePutAwaySessionRequestCWProxyImpl(this._value);

  @override
  CreatePutAwaySessionRequest locationCode(String? locationCode) =>
      this(locationCode: locationCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePutAwaySessionRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePutAwaySessionRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePutAwaySessionRequest call({
    Object? locationCode = const $CopyWithPlaceholder(),
  }) {
    return CreatePutAwaySessionRequest(
      locationCode: locationCode == const $CopyWithPlaceholder()
          ? _value.locationCode
          // ignore: cast_nullable_to_non_nullable
          : locationCode as String?,
    );
  }
}

extension $CreatePutAwaySessionRequestCopyWith on CreatePutAwaySessionRequest {
  /// Returns a callable class that can be used as follows: `instanceOfCreatePutAwaySessionRequest.copyWith(...)` or like so:`instanceOfCreatePutAwaySessionRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreatePutAwaySessionRequestCWProxy get copyWith =>
      _$CreatePutAwaySessionRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePutAwaySessionRequest _$CreatePutAwaySessionRequestFromJson(
        Map<String, dynamic> json) =>
    CreatePutAwaySessionRequest(
      locationCode: json['locationCode'] as String?,
    );

Map<String, dynamic> _$CreatePutAwaySessionRequestToJson(
        CreatePutAwaySessionRequest instance) =>
    <String, dynamic>{
      'locationCode': instance.locationCode,
    };
