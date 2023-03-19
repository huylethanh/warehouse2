// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_away_session_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PutAwaySessionResponseCWProxy {
  PutAwaySessionResponse items(List<PutAwaySession>? items);

  PutAwaySessionResponse objectCode(String? objectCode);

  PutAwaySessionResponse objectType(String? objectType);

  PutAwaySessionResponse partnerName(String? partnerName);

  PutAwaySessionResponse totalWeight(double? totalWeight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PutAwaySessionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PutAwaySessionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  PutAwaySessionResponse call({
    List<PutAwaySession>? items,
    String? objectCode,
    String? objectType,
    String? partnerName,
    double? totalWeight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPutAwaySessionResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPutAwaySessionResponse.copyWith.fieldName(...)`
class _$PutAwaySessionResponseCWProxyImpl
    implements _$PutAwaySessionResponseCWProxy {
  final PutAwaySessionResponse _value;

  const _$PutAwaySessionResponseCWProxyImpl(this._value);

  @override
  PutAwaySessionResponse items(List<PutAwaySession>? items) =>
      this(items: items);

  @override
  PutAwaySessionResponse objectCode(String? objectCode) =>
      this(objectCode: objectCode);

  @override
  PutAwaySessionResponse objectType(String? objectType) =>
      this(objectType: objectType);

  @override
  PutAwaySessionResponse partnerName(String? partnerName) =>
      this(partnerName: partnerName);

  @override
  PutAwaySessionResponse totalWeight(double? totalWeight) =>
      this(totalWeight: totalWeight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PutAwaySessionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PutAwaySessionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  PutAwaySessionResponse call({
    Object? items = const $CopyWithPlaceholder(),
    Object? objectCode = const $CopyWithPlaceholder(),
    Object? objectType = const $CopyWithPlaceholder(),
    Object? partnerName = const $CopyWithPlaceholder(),
    Object? totalWeight = const $CopyWithPlaceholder(),
  }) {
    return PutAwaySessionResponse(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<PutAwaySession>?,
      objectCode: objectCode == const $CopyWithPlaceholder()
          ? _value.objectCode
          // ignore: cast_nullable_to_non_nullable
          : objectCode as String?,
      objectType: objectType == const $CopyWithPlaceholder()
          ? _value.objectType
          // ignore: cast_nullable_to_non_nullable
          : objectType as String?,
      partnerName: partnerName == const $CopyWithPlaceholder()
          ? _value.partnerName
          // ignore: cast_nullable_to_non_nullable
          : partnerName as String?,
      totalWeight: totalWeight == const $CopyWithPlaceholder()
          ? _value.totalWeight
          // ignore: cast_nullable_to_non_nullable
          : totalWeight as double?,
    );
  }
}

extension $PutAwaySessionResponseCopyWith on PutAwaySessionResponse {
  /// Returns a callable class that can be used as follows: `instanceOfPutAwaySessionResponse.copyWith(...)` or like so:`instanceOfPutAwaySessionResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PutAwaySessionResponseCWProxy get copyWith =>
      _$PutAwaySessionResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutAwaySessionResponse _$PutAwaySessionResponseFromJson(
        Map<String, dynamic> json) =>
    PutAwaySessionResponse(
      items: (json['putAwaySessionId'] as List<dynamic>?)
          ?.map((e) => PutAwaySession.fromJson(e as Map<String, dynamic>))
          .toList(),
      partnerName: json['partnerName'] as String?,
      totalWeight: (json['totalWeight'] as num?)?.toDouble(),
      objectCode: json['objectCode'] as String?,
      objectType: json['objectType'] as String?,
    );

Map<String, dynamic> _$PutAwaySessionResponseToJson(
        PutAwaySessionResponse instance) =>
    <String, dynamic>{
      'putAwaySessionId': instance.items,
      'partnerName': instance.partnerName,
      'totalWeight': instance.totalWeight,
      'objectCode': instance.objectCode,
      'objectType': instance.objectType,
    };
