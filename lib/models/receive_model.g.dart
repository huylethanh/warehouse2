// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReceiveModelCWProxy {
  ReceiveModel code(String? code);

  ReceiveModel createdDate(DateTime? createdDate);

  ReceiveModel irCode(String? irCode);

  ReceiveModel irId(int? irId);

  ReceiveModel partnerCode(String? partnerCode);

  ReceiveModel shortName(String? shortName);

  ReceiveModel warehouseId(int? warehouseId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReceiveModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReceiveModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ReceiveModel call({
    String? code,
    DateTime? createdDate,
    String? irCode,
    int? irId,
    String? partnerCode,
    String? shortName,
    int? warehouseId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReceiveModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReceiveModel.copyWith.fieldName(...)`
class _$ReceiveModelCWProxyImpl implements _$ReceiveModelCWProxy {
  final ReceiveModel _value;

  const _$ReceiveModelCWProxyImpl(this._value);

  @override
  ReceiveModel code(String? code) => this(code: code);

  @override
  ReceiveModel createdDate(DateTime? createdDate) =>
      this(createdDate: createdDate);

  @override
  ReceiveModel irCode(String? irCode) => this(irCode: irCode);

  @override
  ReceiveModel irId(int? irId) => this(irId: irId);

  @override
  ReceiveModel partnerCode(String? partnerCode) =>
      this(partnerCode: partnerCode);

  @override
  ReceiveModel shortName(String? shortName) => this(shortName: shortName);

  @override
  ReceiveModel warehouseId(int? warehouseId) => this(warehouseId: warehouseId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReceiveModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReceiveModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ReceiveModel call({
    Object? code = const $CopyWithPlaceholder(),
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? irCode = const $CopyWithPlaceholder(),
    Object? irId = const $CopyWithPlaceholder(),
    Object? partnerCode = const $CopyWithPlaceholder(),
    Object? shortName = const $CopyWithPlaceholder(),
    Object? warehouseId = const $CopyWithPlaceholder(),
  }) {
    return ReceiveModel(
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      createdDate: createdDate == const $CopyWithPlaceholder()
          ? _value.createdDate
          // ignore: cast_nullable_to_non_nullable
          : createdDate as DateTime?,
      irCode: irCode == const $CopyWithPlaceholder()
          ? _value.irCode
          // ignore: cast_nullable_to_non_nullable
          : irCode as String?,
      irId: irId == const $CopyWithPlaceholder()
          ? _value.irId
          // ignore: cast_nullable_to_non_nullable
          : irId as int?,
      partnerCode: partnerCode == const $CopyWithPlaceholder()
          ? _value.partnerCode
          // ignore: cast_nullable_to_non_nullable
          : partnerCode as String?,
      shortName: shortName == const $CopyWithPlaceholder()
          ? _value.shortName
          // ignore: cast_nullable_to_non_nullable
          : shortName as String?,
      warehouseId: warehouseId == const $CopyWithPlaceholder()
          ? _value.warehouseId
          // ignore: cast_nullable_to_non_nullable
          : warehouseId as int?,
    );
  }
}

extension $ReceiveModelCopyWith on ReceiveModel {
  /// Returns a callable class that can be used as follows: `instanceOfReceiveModel.copyWith(...)` or like so:`instanceOfReceiveModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReceiveModelCWProxy get copyWith => _$ReceiveModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveModel _$ReceiveModelFromJson(Map<String, dynamic> json) => ReceiveModel(
      irId: json['irId'] as int?,
      code: json['code'] as String?,
      partnerCode: json['partnerCode'] as String?,
      shortName: json['shortName'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      irCode: json['irCode'] as String?,
      warehouseId: json['warehouseId'] as int?,
    );

Map<String, dynamic> _$ReceiveModelToJson(ReceiveModel instance) =>
    <String, dynamic>{
      'irId': instance.irId,
      'code': instance.code,
      'partnerCode': instance.partnerCode,
      'shortName': instance.shortName,
      'createdDate': instance.createdDate?.toIso8601String(),
      'irCode': instance.irCode,
      'warehouseId': instance.warehouseId,
    };
