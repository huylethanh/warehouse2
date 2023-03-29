// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_process_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PickProcessResponseCWProxy {
  PickProcessResponse isFinished(bool isFinished);

  PickProcessResponse isReload(bool isReload);

  PickProcessResponse message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickProcessResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickProcessResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  PickProcessResponse call({
    bool? isFinished,
    bool? isReload,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPickProcessResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPickProcessResponse.copyWith.fieldName(...)`
class _$PickProcessResponseCWProxyImpl implements _$PickProcessResponseCWProxy {
  final PickProcessResponse _value;

  const _$PickProcessResponseCWProxyImpl(this._value);

  @override
  PickProcessResponse isFinished(bool isFinished) =>
      this(isFinished: isFinished);

  @override
  PickProcessResponse isReload(bool isReload) => this(isReload: isReload);

  @override
  PickProcessResponse message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickProcessResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickProcessResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  PickProcessResponse call({
    Object? isFinished = const $CopyWithPlaceholder(),
    Object? isReload = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return PickProcessResponse(
      isFinished:
          isFinished == const $CopyWithPlaceholder() || isFinished == null
              ? _value.isFinished
              // ignore: cast_nullable_to_non_nullable
              : isFinished as bool,
      isReload: isReload == const $CopyWithPlaceholder() || isReload == null
          ? _value.isReload
          // ignore: cast_nullable_to_non_nullable
          : isReload as bool,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $PickProcessResponseCopyWith on PickProcessResponse {
  /// Returns a callable class that can be used as follows: `instanceOfPickProcessResponse.copyWith(...)` or like so:`instanceOfPickProcessResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PickProcessResponseCWProxy get copyWith =>
      _$PickProcessResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickProcessResponse _$PickProcessResponseFromJson(Map<String, dynamic> json) =>
    PickProcessResponse(
      isFinished: json['isFinished'] as bool? ?? false,
      isReload: json['isReload'] as bool? ?? false,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PickProcessResponseToJson(
        PickProcessResponse instance) =>
    <String, dynamic>{
      'isFinished': instance.isFinished,
      'isReload': instance.isReload,
      'message': instance.message,
    };
