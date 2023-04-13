// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbound_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InboundResponseCWProxy {
  InboundResponse conditionType(int? conditionType);

  InboundResponse detail(List<ReceiveProduct>? detail);

  InboundResponse irCode(String? irCode);

  InboundResponse irId(int? irId);

  InboundResponse irStatus(int? irStatus);

  InboundResponse orId(int? orId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InboundResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InboundResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  InboundResponse call({
    int? conditionType,
    List<ReceiveProduct>? detail,
    String? irCode,
    int? irId,
    int? irStatus,
    int? orId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInboundResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInboundResponse.copyWith.fieldName(...)`
class _$InboundResponseCWProxyImpl implements _$InboundResponseCWProxy {
  final InboundResponse _value;

  const _$InboundResponseCWProxyImpl(this._value);

  @override
  InboundResponse conditionType(int? conditionType) =>
      this(conditionType: conditionType);

  @override
  InboundResponse detail(List<ReceiveProduct>? detail) => this(detail: detail);

  @override
  InboundResponse irCode(String? irCode) => this(irCode: irCode);

  @override
  InboundResponse irId(int? irId) => this(irId: irId);

  @override
  InboundResponse irStatus(int? irStatus) => this(irStatus: irStatus);

  @override
  InboundResponse orId(int? orId) => this(orId: orId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InboundResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InboundResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  InboundResponse call({
    Object? conditionType = const $CopyWithPlaceholder(),
    Object? detail = const $CopyWithPlaceholder(),
    Object? irCode = const $CopyWithPlaceholder(),
    Object? irId = const $CopyWithPlaceholder(),
    Object? irStatus = const $CopyWithPlaceholder(),
    Object? orId = const $CopyWithPlaceholder(),
  }) {
    return InboundResponse(
      conditionType: conditionType == const $CopyWithPlaceholder()
          ? _value.conditionType
          // ignore: cast_nullable_to_non_nullable
          : conditionType as int?,
      detail: detail == const $CopyWithPlaceholder()
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as List<ReceiveProduct>?,
      irCode: irCode == const $CopyWithPlaceholder()
          ? _value.irCode
          // ignore: cast_nullable_to_non_nullable
          : irCode as String?,
      irId: irId == const $CopyWithPlaceholder()
          ? _value.irId
          // ignore: cast_nullable_to_non_nullable
          : irId as int?,
      irStatus: irStatus == const $CopyWithPlaceholder()
          ? _value.irStatus
          // ignore: cast_nullable_to_non_nullable
          : irStatus as int?,
      orId: orId == const $CopyWithPlaceholder()
          ? _value.orId
          // ignore: cast_nullable_to_non_nullable
          : orId as int?,
    );
  }
}

extension $InboundResponseCopyWith on InboundResponse {
  /// Returns a callable class that can be used as follows: `instanceOfInboundResponse.copyWith(...)` or like so:`instanceOfInboundResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InboundResponseCWProxy get copyWith => _$InboundResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InboundResponse _$InboundResponseFromJson(Map<String, dynamic> json) =>
    InboundResponse(
      irId: json['irId'] as int?,
      orId: json['orId'] as int?,
      irCode: json['irCode'] as String?,
      irStatus: json['irStatus'] as int?,
      conditionType: json['conditionType'] as int?,
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) => ReceiveProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InboundResponseToJson(InboundResponse instance) =>
    <String, dynamic>{
      'irId': instance.irId,
      'orId': instance.orId,
      'irCode': instance.irCode,
      'irStatus': instance.irStatus,
      'conditionType': instance.conditionType,
      'detail': instance.detail,
    };
