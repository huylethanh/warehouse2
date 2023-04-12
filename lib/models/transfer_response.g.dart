// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransferResponseCWProxy {
  TransferResponse id(int? id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferResponse call({
    int? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTransferResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTransferResponse.copyWith.fieldName(...)`
class _$TransferResponseCWProxyImpl implements _$TransferResponseCWProxy {
  final TransferResponse _value;

  const _$TransferResponseCWProxyImpl(this._value);

  @override
  TransferResponse id(int? id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferResponse call({
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return TransferResponse(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
    );
  }
}

extension $TransferResponseCopyWith on TransferResponse {
  /// Returns a callable class that can be used as follows: `instanceOfTransferResponse.copyWith(...)` or like so:`instanceOfTransferResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TransferResponseCWProxy get copyWith => _$TransferResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferResponse _$TransferResponseFromJson(Map<String, dynamic> json) =>
    TransferResponse(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$TransferResponseToJson(TransferResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
