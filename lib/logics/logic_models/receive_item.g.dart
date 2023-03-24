// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReceivedItemCWProxy {
  ReceivedItem count(int? count);

  ReceivedItem imageUrl(String? imageUrl);

  ReceivedItem item(CheckingProduct? item);

  ReceivedItem name(String? name);

  ReceivedItem weight(String? weight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReceivedItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReceivedItem(...).copyWith(id: 12, name: "My name")
  /// ````
  ReceivedItem call({
    int? count,
    String? imageUrl,
    CheckingProduct? item,
    String? name,
    String? weight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReceivedItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReceivedItem.copyWith.fieldName(...)`
class _$ReceivedItemCWProxyImpl implements _$ReceivedItemCWProxy {
  final ReceivedItem _value;

  const _$ReceivedItemCWProxyImpl(this._value);

  @override
  ReceivedItem count(int? count) => this(count: count);

  @override
  ReceivedItem imageUrl(String? imageUrl) => this(imageUrl: imageUrl);

  @override
  ReceivedItem item(CheckingProduct? item) => this(item: item);

  @override
  ReceivedItem name(String? name) => this(name: name);

  @override
  ReceivedItem weight(String? weight) => this(weight: weight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReceivedItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReceivedItem(...).copyWith(id: 12, name: "My name")
  /// ````
  ReceivedItem call({
    Object? count = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? item = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
  }) {
    return ReceivedItem(
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      imageUrl: imageUrl == const $CopyWithPlaceholder()
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String?,
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as CheckingProduct?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      weight: weight == const $CopyWithPlaceholder()
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as String?,
    );
  }
}

extension $ReceivedItemCopyWith on ReceivedItem {
  /// Returns a callable class that can be used as follows: `instanceOfReceivedItem.copyWith(...)` or like so:`instanceOfReceivedItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReceivedItemCWProxy get copyWith => _$ReceivedItemCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `ReceivedItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReceivedItem(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  ReceivedItem copyWithNull({
    bool count = false,
    bool imageUrl = false,
    bool item = false,
    bool name = false,
    bool weight = false,
  }) {
    return ReceivedItem(
      count: count == true ? null : this.count,
      imageUrl: imageUrl == true ? null : this.imageUrl,
      item: item == true ? null : this.item,
      name: name == true ? null : this.name,
      weight: weight == true ? null : this.weight,
    );
  }
}
