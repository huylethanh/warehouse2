// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IdResponseCWProxy {
  IdResponse id(int? id);

  IdResponse name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IdResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IdResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  IdResponse call({
    int? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIdResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIdResponse.copyWith.fieldName(...)`
class _$IdResponseCWProxyImpl implements _$IdResponseCWProxy {
  final IdResponse _value;

  const _$IdResponseCWProxyImpl(this._value);

  @override
  IdResponse id(int? id) => this(id: id);

  @override
  IdResponse name(String? name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IdResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IdResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  IdResponse call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return IdResponse(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $IdResponseCopyWith on IdResponse {
  /// Returns a callable class that can be used as follows: `instanceOfIdResponse.copyWith(...)` or like so:`instanceOfIdResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IdResponseCWProxy get copyWith => _$IdResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdResponse _$IdResponseFromJson(Map<String, dynamic> json) => IdResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$IdResponseToJson(IdResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
