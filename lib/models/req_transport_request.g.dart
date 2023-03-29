// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_transport_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegTransportRequestCWProxy {
  RegTransportRequest locationCodes(List<String>? locationCodes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegTransportRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegTransportRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  RegTransportRequest call({
    List<String>? locationCodes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRegTransportRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRegTransportRequest.copyWith.fieldName(...)`
class _$RegTransportRequestCWProxyImpl implements _$RegTransportRequestCWProxy {
  final RegTransportRequest _value;

  const _$RegTransportRequestCWProxyImpl(this._value);

  @override
  RegTransportRequest locationCodes(List<String>? locationCodes) =>
      this(locationCodes: locationCodes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegTransportRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegTransportRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  RegTransportRequest call({
    Object? locationCodes = const $CopyWithPlaceholder(),
  }) {
    return RegTransportRequest(
      locationCodes: locationCodes == const $CopyWithPlaceholder()
          ? _value.locationCodes
          // ignore: cast_nullable_to_non_nullable
          : locationCodes as List<String>?,
    );
  }
}

extension $RegTransportRequestCopyWith on RegTransportRequest {
  /// Returns a callable class that can be used as follows: `instanceOfRegTransportRequest.copyWith(...)` or like so:`instanceOfRegTransportRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegTransportRequestCWProxy get copyWith =>
      _$RegTransportRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegTransportRequest _$RegTransportRequestFromJson(Map<String, dynamic> json) =>
    RegTransportRequest(
      locationCodes: (json['locationCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RegTransportRequestToJson(
        RegTransportRequest instance) =>
    <String, dynamic>{
      'locationCodes': instance.locationCodes,
    };
