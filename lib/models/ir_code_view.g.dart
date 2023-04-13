// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_code_view.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IrCodeViewCWProxy {
  IrCodeView irCode(String? irCode);

  IrCodeView qty(int? qty);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IrCodeView(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IrCodeView(...).copyWith(id: 12, name: "My name")
  /// ````
  IrCodeView call({
    String? irCode,
    int? qty,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIrCodeView.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIrCodeView.copyWith.fieldName(...)`
class _$IrCodeViewCWProxyImpl implements _$IrCodeViewCWProxy {
  final IrCodeView _value;

  const _$IrCodeViewCWProxyImpl(this._value);

  @override
  IrCodeView irCode(String? irCode) => this(irCode: irCode);

  @override
  IrCodeView qty(int? qty) => this(qty: qty);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IrCodeView(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IrCodeView(...).copyWith(id: 12, name: "My name")
  /// ````
  IrCodeView call({
    Object? irCode = const $CopyWithPlaceholder(),
    Object? qty = const $CopyWithPlaceholder(),
  }) {
    return IrCodeView(
      irCode: irCode == const $CopyWithPlaceholder()
          ? _value.irCode
          // ignore: cast_nullable_to_non_nullable
          : irCode as String?,
      qty: qty == const $CopyWithPlaceholder()
          ? _value.qty
          // ignore: cast_nullable_to_non_nullable
          : qty as int?,
    );
  }
}

extension $IrCodeViewCopyWith on IrCodeView {
  /// Returns a callable class that can be used as follows: `instanceOfIrCodeView.copyWith(...)` or like so:`instanceOfIrCodeView.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IrCodeViewCWProxy get copyWith => _$IrCodeViewCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IrCodeView _$IrCodeViewFromJson(Map<String, dynamic> json) => IrCodeView(
      irCode: json['irCode'] as String?,
      qty: json['qty'] as int?,
    );

Map<String, dynamic> _$IrCodeViewToJson(IrCodeView instance) =>
    <String, dynamic>{
      'irCode': instance.irCode,
      'qty': instance.qty,
    };
