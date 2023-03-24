// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_transport.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NewTransportCWProxy {
  NewTransport checkList(List<CheckListItem> checkList);

  NewTransport partner(String partner);

  NewTransport total(int total);

  NewTransport transportCode(String? transportCode);

  NewTransport weight(String weight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewTransport(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewTransport(...).copyWith(id: 12, name: "My name")
  /// ````
  NewTransport call({
    List<CheckListItem>? checkList,
    String? partner,
    int? total,
    String? transportCode,
    String? weight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNewTransport.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNewTransport.copyWith.fieldName(...)`
class _$NewTransportCWProxyImpl implements _$NewTransportCWProxy {
  final NewTransport _value;

  const _$NewTransportCWProxyImpl(this._value);

  @override
  NewTransport checkList(List<CheckListItem> checkList) =>
      this(checkList: checkList);

  @override
  NewTransport partner(String partner) => this(partner: partner);

  @override
  NewTransport total(int total) => this(total: total);

  @override
  NewTransport transportCode(String? transportCode) =>
      this(transportCode: transportCode);

  @override
  NewTransport weight(String weight) => this(weight: weight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewTransport(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewTransport(...).copyWith(id: 12, name: "My name")
  /// ````
  NewTransport call({
    Object? checkList = const $CopyWithPlaceholder(),
    Object? partner = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? transportCode = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
  }) {
    return NewTransport(
      checkList: checkList == const $CopyWithPlaceholder() || checkList == null
          ? _value.checkList
          // ignore: cast_nullable_to_non_nullable
          : checkList as List<CheckListItem>,
      partner: partner == const $CopyWithPlaceholder() || partner == null
          ? _value.partner
          // ignore: cast_nullable_to_non_nullable
          : partner as String,
      total: total == const $CopyWithPlaceholder() || total == null
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int,
      transportCode: transportCode == const $CopyWithPlaceholder()
          ? _value.transportCode
          // ignore: cast_nullable_to_non_nullable
          : transportCode as String?,
      weight: weight == const $CopyWithPlaceholder() || weight == null
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as String,
    );
  }
}

extension $NewTransportCopyWith on NewTransport {
  /// Returns a callable class that can be used as follows: `instanceOfNewTransport.copyWith(...)` or like so:`instanceOfNewTransport.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NewTransportCWProxy get copyWith => _$NewTransportCWProxyImpl(this);
}
