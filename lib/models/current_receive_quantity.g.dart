// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_receive_quantity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CurrentReceiveQuantityCWProxy {
  CurrentReceiveQuantity actualQty(int? actualQty);

  CurrentReceiveQuantity exceptionQty(int? exceptionQty);

  CurrentReceiveQuantity expectQty(int? expectQty);

  CurrentReceiveQuantity irId(int? irId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CurrentReceiveQuantity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CurrentReceiveQuantity(...).copyWith(id: 12, name: "My name")
  /// ````
  CurrentReceiveQuantity call({
    int? actualQty,
    int? exceptionQty,
    int? expectQty,
    int? irId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCurrentReceiveQuantity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCurrentReceiveQuantity.copyWith.fieldName(...)`
class _$CurrentReceiveQuantityCWProxyImpl
    implements _$CurrentReceiveQuantityCWProxy {
  final CurrentReceiveQuantity _value;

  const _$CurrentReceiveQuantityCWProxyImpl(this._value);

  @override
  CurrentReceiveQuantity actualQty(int? actualQty) =>
      this(actualQty: actualQty);

  @override
  CurrentReceiveQuantity exceptionQty(int? exceptionQty) =>
      this(exceptionQty: exceptionQty);

  @override
  CurrentReceiveQuantity expectQty(int? expectQty) =>
      this(expectQty: expectQty);

  @override
  CurrentReceiveQuantity irId(int? irId) => this(irId: irId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CurrentReceiveQuantity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CurrentReceiveQuantity(...).copyWith(id: 12, name: "My name")
  /// ````
  CurrentReceiveQuantity call({
    Object? actualQty = const $CopyWithPlaceholder(),
    Object? exceptionQty = const $CopyWithPlaceholder(),
    Object? expectQty = const $CopyWithPlaceholder(),
    Object? irId = const $CopyWithPlaceholder(),
  }) {
    return CurrentReceiveQuantity(
      actualQty: actualQty == const $CopyWithPlaceholder()
          ? _value.actualQty
          // ignore: cast_nullable_to_non_nullable
          : actualQty as int?,
      exceptionQty: exceptionQty == const $CopyWithPlaceholder()
          ? _value.exceptionQty
          // ignore: cast_nullable_to_non_nullable
          : exceptionQty as int?,
      expectQty: expectQty == const $CopyWithPlaceholder()
          ? _value.expectQty
          // ignore: cast_nullable_to_non_nullable
          : expectQty as int?,
      irId: irId == const $CopyWithPlaceholder()
          ? _value.irId
          // ignore: cast_nullable_to_non_nullable
          : irId as int?,
    );
  }
}

extension $CurrentReceiveQuantityCopyWith on CurrentReceiveQuantity {
  /// Returns a callable class that can be used as follows: `instanceOfCurrentReceiveQuantity.copyWith(...)` or like so:`instanceOfCurrentReceiveQuantity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CurrentReceiveQuantityCWProxy get copyWith =>
      _$CurrentReceiveQuantityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentReceiveQuantity _$CurrentReceiveQuantityFromJson(
        Map<String, dynamic> json) =>
    CurrentReceiveQuantity(
      irId: json['irId'] as int?,
      expectQty: json['expectQty'] as int?,
      actualQty: json['actualQty'] as int?,
      exceptionQty: json['exceptionQty'] as int?,
    );

Map<String, dynamic> _$CurrentReceiveQuantityToJson(
        CurrentReceiveQuantity instance) =>
    <String, dynamic>{
      'irId': instance.irId,
      'expectQty': instance.expectQty,
      'actualQty': instance.actualQty,
      'exceptionQty': instance.exceptionQty,
    };
