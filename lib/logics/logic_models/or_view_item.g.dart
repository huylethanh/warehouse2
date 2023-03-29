// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'or_view_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ORViewItemCWProxy {
  ORViewItem chosen(bool chosen);

  ORViewItem code(String? code);

  ORViewItem createdDate(String? createdDate);

  ORViewItem currentMinute(int currentMinute);

  ORViewItem dataIndex(int? dataIndex);

  ORViewItem orAmount(String? orAmount);

  ORViewItem pickListId(int? pickListId);

  ORViewItem priority(int? priority);

  ORViewItem productAmount(String? productAmount);

  ORViewItem sizeName(String? sizeName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ORViewItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ORViewItem(...).copyWith(id: 12, name: "My name")
  /// ````
  ORViewItem call({
    bool? chosen,
    String? code,
    String? createdDate,
    int? currentMinute,
    int? dataIndex,
    String? orAmount,
    int? pickListId,
    int? priority,
    String? productAmount,
    String? sizeName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfORViewItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfORViewItem.copyWith.fieldName(...)`
class _$ORViewItemCWProxyImpl implements _$ORViewItemCWProxy {
  final ORViewItem _value;

  const _$ORViewItemCWProxyImpl(this._value);

  @override
  ORViewItem chosen(bool chosen) => this(chosen: chosen);

  @override
  ORViewItem code(String? code) => this(code: code);

  @override
  ORViewItem createdDate(String? createdDate) => this(createdDate: createdDate);

  @override
  ORViewItem currentMinute(int currentMinute) =>
      this(currentMinute: currentMinute);

  @override
  ORViewItem dataIndex(int? dataIndex) => this(dataIndex: dataIndex);

  @override
  ORViewItem orAmount(String? orAmount) => this(orAmount: orAmount);

  @override
  ORViewItem pickListId(int? pickListId) => this(pickListId: pickListId);

  @override
  ORViewItem priority(int? priority) => this(priority: priority);

  @override
  ORViewItem productAmount(String? productAmount) =>
      this(productAmount: productAmount);

  @override
  ORViewItem sizeName(String? sizeName) => this(sizeName: sizeName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ORViewItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ORViewItem(...).copyWith(id: 12, name: "My name")
  /// ````
  ORViewItem call({
    Object? chosen = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? currentMinute = const $CopyWithPlaceholder(),
    Object? dataIndex = const $CopyWithPlaceholder(),
    Object? orAmount = const $CopyWithPlaceholder(),
    Object? pickListId = const $CopyWithPlaceholder(),
    Object? priority = const $CopyWithPlaceholder(),
    Object? productAmount = const $CopyWithPlaceholder(),
    Object? sizeName = const $CopyWithPlaceholder(),
  }) {
    return ORViewItem(
      chosen: chosen == const $CopyWithPlaceholder() || chosen == null
          ? _value.chosen
          // ignore: cast_nullable_to_non_nullable
          : chosen as bool,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      createdDate: createdDate == const $CopyWithPlaceholder()
          ? _value.createdDate
          // ignore: cast_nullable_to_non_nullable
          : createdDate as String?,
      currentMinute:
          currentMinute == const $CopyWithPlaceholder() || currentMinute == null
              ? _value.currentMinute
              // ignore: cast_nullable_to_non_nullable
              : currentMinute as int,
      dataIndex: dataIndex == const $CopyWithPlaceholder()
          ? _value.dataIndex
          // ignore: cast_nullable_to_non_nullable
          : dataIndex as int?,
      orAmount: orAmount == const $CopyWithPlaceholder()
          ? _value.orAmount
          // ignore: cast_nullable_to_non_nullable
          : orAmount as String?,
      pickListId: pickListId == const $CopyWithPlaceholder()
          ? _value.pickListId
          // ignore: cast_nullable_to_non_nullable
          : pickListId as int?,
      priority: priority == const $CopyWithPlaceholder()
          ? _value.priority
          // ignore: cast_nullable_to_non_nullable
          : priority as int?,
      productAmount: productAmount == const $CopyWithPlaceholder()
          ? _value.productAmount
          // ignore: cast_nullable_to_non_nullable
          : productAmount as String?,
      sizeName: sizeName == const $CopyWithPlaceholder()
          ? _value.sizeName
          // ignore: cast_nullable_to_non_nullable
          : sizeName as String?,
    );
  }
}

extension $ORViewItemCopyWith on ORViewItem {
  /// Returns a callable class that can be used as follows: `instanceOfORViewItem.copyWith(...)` or like so:`instanceOfORViewItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ORViewItemCWProxy get copyWith => _$ORViewItemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ORViewItem _$ORViewItemFromJson(Map<String, dynamic> json) => ORViewItem(
      pickListId: json['pickListId'] as int?,
      code: json['code'] as String?,
      orAmount: json['orAmount'] as String?,
      productAmount: json['productAmount'] as String?,
      sizeName: json['sizeName'] as String?,
      createdDate: json['createdDate'] as String?,
      dataIndex: json['dataIndex'] as int?,
      chosen: json['chosen'] as bool? ?? false,
      priority: json['priority'] as int?,
      currentMinute: json['currentMinute'] as int? ?? 0,
    );

Map<String, dynamic> _$ORViewItemToJson(ORViewItem instance) =>
    <String, dynamic>{
      'pickListId': instance.pickListId,
      'code': instance.code,
      'orAmount': instance.orAmount,
      'productAmount': instance.productAmount,
      'sizeName': instance.sizeName,
      'createdDate': instance.createdDate,
      'dataIndex': instance.dataIndex,
      'chosen': instance.chosen,
      'priority': instance.priority,
      'currentMinute': instance.currentMinute,
    };
