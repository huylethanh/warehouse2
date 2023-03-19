// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_demension_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CheckDimensionResponseCWProxy {
  CheckDimensionResponse actualWeight(double? actualWeight);

  CheckDimensionResponse hasPhysicalData(bool? hasPhysicalData);

  CheckDimensionResponse height(double? height);

  CheckDimensionResponse length(double? length);

  CheckDimensionResponse width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CheckDimensionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CheckDimensionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CheckDimensionResponse call({
    double? actualWeight,
    bool? hasPhysicalData,
    double? height,
    double? length,
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCheckDimensionResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCheckDimensionResponse.copyWith.fieldName(...)`
class _$CheckDimensionResponseCWProxyImpl
    implements _$CheckDimensionResponseCWProxy {
  final CheckDimensionResponse _value;

  const _$CheckDimensionResponseCWProxyImpl(this._value);

  @override
  CheckDimensionResponse actualWeight(double? actualWeight) =>
      this(actualWeight: actualWeight);

  @override
  CheckDimensionResponse hasPhysicalData(bool? hasPhysicalData) =>
      this(hasPhysicalData: hasPhysicalData);

  @override
  CheckDimensionResponse height(double? height) => this(height: height);

  @override
  CheckDimensionResponse length(double? length) => this(length: length);

  @override
  CheckDimensionResponse width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CheckDimensionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CheckDimensionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CheckDimensionResponse call({
    Object? actualWeight = const $CopyWithPlaceholder(),
    Object? hasPhysicalData = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
    Object? length = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return CheckDimensionResponse(
      actualWeight: actualWeight == const $CopyWithPlaceholder()
          ? _value.actualWeight
          // ignore: cast_nullable_to_non_nullable
          : actualWeight as double?,
      hasPhysicalData: hasPhysicalData == const $CopyWithPlaceholder()
          ? _value.hasPhysicalData
          // ignore: cast_nullable_to_non_nullable
          : hasPhysicalData as bool?,
      height: height == const $CopyWithPlaceholder()
          ? _value.height
          // ignore: cast_nullable_to_non_nullable
          : height as double?,
      length: length == const $CopyWithPlaceholder()
          ? _value.length
          // ignore: cast_nullable_to_non_nullable
          : length as double?,
      width: width == const $CopyWithPlaceholder()
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as double?,
    );
  }
}

extension $CheckDimensionResponseCopyWith on CheckDimensionResponse {
  /// Returns a callable class that can be used as follows: `instanceOfCheckDimensionResponse.copyWith(...)` or like so:`instanceOfCheckDimensionResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CheckDimensionResponseCWProxy get copyWith =>
      _$CheckDimensionResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckDimensionResponse _$CheckDimensionResponseFromJson(
        Map<String, dynamic> json) =>
    CheckDimensionResponse(
      hasPhysicalData: json['hasPhysicalData'] as bool?,
      actualWeight: (json['actualWeight'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CheckDimensionResponseToJson(
        CheckDimensionResponse instance) =>
    <String, dynamic>{
      'hasPhysicalData': instance.hasPhysicalData,
      'actualWeight': instance.actualWeight,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
    };
