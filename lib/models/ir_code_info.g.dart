// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_code_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IrCodeInfoCWProxy {
  IrCodeInfo irCode(String? irCode);

  IrCodeInfo irId(int? irId);

  IrCodeInfo qty(int? qty);

  IrCodeInfo receivedDate(String? receivedDate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IrCodeInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IrCodeInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  IrCodeInfo call({
    String? irCode,
    int? irId,
    int? qty,
    String? receivedDate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIrCodeInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIrCodeInfo.copyWith.fieldName(...)`
class _$IrCodeInfoCWProxyImpl implements _$IrCodeInfoCWProxy {
  final IrCodeInfo _value;

  const _$IrCodeInfoCWProxyImpl(this._value);

  @override
  IrCodeInfo irCode(String? irCode) => this(irCode: irCode);

  @override
  IrCodeInfo irId(int? irId) => this(irId: irId);

  @override
  IrCodeInfo qty(int? qty) => this(qty: qty);

  @override
  IrCodeInfo receivedDate(String? receivedDate) =>
      this(receivedDate: receivedDate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IrCodeInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IrCodeInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  IrCodeInfo call({
    Object? irCode = const $CopyWithPlaceholder(),
    Object? irId = const $CopyWithPlaceholder(),
    Object? qty = const $CopyWithPlaceholder(),
    Object? receivedDate = const $CopyWithPlaceholder(),
  }) {
    return IrCodeInfo(
      irCode: irCode == const $CopyWithPlaceholder()
          ? _value.irCode
          // ignore: cast_nullable_to_non_nullable
          : irCode as String?,
      irId: irId == const $CopyWithPlaceholder()
          ? _value.irId
          // ignore: cast_nullable_to_non_nullable
          : irId as int?,
      qty: qty == const $CopyWithPlaceholder()
          ? _value.qty
          // ignore: cast_nullable_to_non_nullable
          : qty as int?,
      receivedDate: receivedDate == const $CopyWithPlaceholder()
          ? _value.receivedDate
          // ignore: cast_nullable_to_non_nullable
          : receivedDate as String?,
    );
  }
}

extension $IrCodeInfoCopyWith on IrCodeInfo {
  /// Returns a callable class that can be used as follows: `instanceOfIrCodeInfo.copyWith(...)` or like so:`instanceOfIrCodeInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IrCodeInfoCWProxy get copyWith => _$IrCodeInfoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IrCodeInfo _$IrCodeInfoFromJson(Map<String, dynamic> json) => IrCodeInfo(
      irId: json['irId'] as int?,
      irCode: json['irCode'] as String?,
      receivedDate: json['receivedDate'] as String?,
      qty: json['qty'] as int?,
    );

Map<String, dynamic> _$IrCodeInfoToJson(IrCodeInfo instance) =>
    <String, dynamic>{
      'irId': instance.irId,
      'irCode': instance.irCode,
      'receivedDate': instance.receivedDate,
      'qty': instance.qty,
    };
