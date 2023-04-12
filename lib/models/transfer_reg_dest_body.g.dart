// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_reg_dest_body.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransferRegDestBodyCWProxy {
  TransferRegDestBody destLocationCode(String? destLocationCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferRegDestBody(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferRegDestBody(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferRegDestBody call({
    String? destLocationCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTransferRegDestBody.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTransferRegDestBody.copyWith.fieldName(...)`
class _$TransferRegDestBodyCWProxyImpl implements _$TransferRegDestBodyCWProxy {
  final TransferRegDestBody _value;

  const _$TransferRegDestBodyCWProxyImpl(this._value);

  @override
  TransferRegDestBody destLocationCode(String? destLocationCode) =>
      this(destLocationCode: destLocationCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferRegDestBody(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferRegDestBody(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferRegDestBody call({
    Object? destLocationCode = const $CopyWithPlaceholder(),
  }) {
    return TransferRegDestBody(
      destLocationCode: destLocationCode == const $CopyWithPlaceholder()
          ? _value.destLocationCode
          // ignore: cast_nullable_to_non_nullable
          : destLocationCode as String?,
    );
  }
}

extension $TransferRegDestBodyCopyWith on TransferRegDestBody {
  /// Returns a callable class that can be used as follows: `instanceOfTransferRegDestBody.copyWith(...)` or like so:`instanceOfTransferRegDestBody.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TransferRegDestBodyCWProxy get copyWith =>
      _$TransferRegDestBodyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferRegDestBody _$TransferRegDestBodyFromJson(Map<String, dynamic> json) =>
    TransferRegDestBody(
      destLocationCode: json['destLocationCode'] as String?,
    );

Map<String, dynamic> _$TransferRegDestBodyToJson(
        TransferRegDestBody instance) =>
    <String, dynamic>{
      'destLocationCode': instance.destLocationCode,
    };
