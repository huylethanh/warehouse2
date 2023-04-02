// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picking_path.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PickingPathCWProxy {
  PickingPath bins(List<PickingBin>? bins);

  PickingPath createdDate(String? createdDate);

  PickingPath numOfItem(int? numOfItem);

  PickingPath numOfOR(int? numOfOR);

  PickingPath pickListCode(String? pickListCode);

  PickingPath pickListId(int? pickListId);

  PickingPath pickSessionId(int? pickSessionId);

  PickingPath priority(int? priority);

  PickingPath products(List<PickProduct>? products);

  PickingPath sizeName(String? sizeName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickingPath(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickingPath(...).copyWith(id: 12, name: "My name")
  /// ````
  PickingPath call({
    List<PickingBin>? bins,
    String? createdDate,
    int? numOfItem,
    int? numOfOR,
    String? pickListCode,
    int? pickListId,
    int? pickSessionId,
    int? priority,
    List<PickProduct>? products,
    String? sizeName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPickingPath.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPickingPath.copyWith.fieldName(...)`
class _$PickingPathCWProxyImpl implements _$PickingPathCWProxy {
  final PickingPath _value;

  const _$PickingPathCWProxyImpl(this._value);

  @override
  PickingPath bins(List<PickingBin>? bins) => this(bins: bins);

  @override
  PickingPath createdDate(String? createdDate) =>
      this(createdDate: createdDate);

  @override
  PickingPath numOfItem(int? numOfItem) => this(numOfItem: numOfItem);

  @override
  PickingPath numOfOR(int? numOfOR) => this(numOfOR: numOfOR);

  @override
  PickingPath pickListCode(String? pickListCode) =>
      this(pickListCode: pickListCode);

  @override
  PickingPath pickListId(int? pickListId) => this(pickListId: pickListId);

  @override
  PickingPath pickSessionId(int? pickSessionId) =>
      this(pickSessionId: pickSessionId);

  @override
  PickingPath priority(int? priority) => this(priority: priority);

  @override
  PickingPath products(List<PickProduct>? products) => this(products: products);

  @override
  PickingPath sizeName(String? sizeName) => this(sizeName: sizeName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickingPath(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickingPath(...).copyWith(id: 12, name: "My name")
  /// ````
  PickingPath call({
    Object? bins = const $CopyWithPlaceholder(),
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? numOfItem = const $CopyWithPlaceholder(),
    Object? numOfOR = const $CopyWithPlaceholder(),
    Object? pickListCode = const $CopyWithPlaceholder(),
    Object? pickListId = const $CopyWithPlaceholder(),
    Object? pickSessionId = const $CopyWithPlaceholder(),
    Object? priority = const $CopyWithPlaceholder(),
    Object? products = const $CopyWithPlaceholder(),
    Object? sizeName = const $CopyWithPlaceholder(),
  }) {
    return PickingPath(
      bins: bins == const $CopyWithPlaceholder()
          ? _value.bins
          // ignore: cast_nullable_to_non_nullable
          : bins as List<PickingBin>?,
      createdDate: createdDate == const $CopyWithPlaceholder()
          ? _value.createdDate
          // ignore: cast_nullable_to_non_nullable
          : createdDate as String?,
      numOfItem: numOfItem == const $CopyWithPlaceholder()
          ? _value.numOfItem
          // ignore: cast_nullable_to_non_nullable
          : numOfItem as int?,
      numOfOR: numOfOR == const $CopyWithPlaceholder()
          ? _value.numOfOR
          // ignore: cast_nullable_to_non_nullable
          : numOfOR as int?,
      pickListCode: pickListCode == const $CopyWithPlaceholder()
          ? _value.pickListCode
          // ignore: cast_nullable_to_non_nullable
          : pickListCode as String?,
      pickListId: pickListId == const $CopyWithPlaceholder()
          ? _value.pickListId
          // ignore: cast_nullable_to_non_nullable
          : pickListId as int?,
      pickSessionId: pickSessionId == const $CopyWithPlaceholder()
          ? _value.pickSessionId
          // ignore: cast_nullable_to_non_nullable
          : pickSessionId as int?,
      priority: priority == const $CopyWithPlaceholder()
          ? _value.priority
          // ignore: cast_nullable_to_non_nullable
          : priority as int?,
      products: products == const $CopyWithPlaceholder()
          ? _value.products
          // ignore: cast_nullable_to_non_nullable
          : products as List<PickProduct>?,
      sizeName: sizeName == const $CopyWithPlaceholder()
          ? _value.sizeName
          // ignore: cast_nullable_to_non_nullable
          : sizeName as String?,
    );
  }
}

extension $PickingPathCopyWith on PickingPath {
  /// Returns a callable class that can be used as follows: `instanceOfPickingPath.copyWith(...)` or like so:`instanceOfPickingPath.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PickingPathCWProxy get copyWith => _$PickingPathCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickingPath _$PickingPathFromJson(Map<String, dynamic> json) => PickingPath(
      pickListId: json['pickListId'] as int?,
      pickListCode: json['pickListCode'] as String?,
      pickSessionId: json['pickSessionId'] as int?,
      numOfOR: json['numOfOR'] as int?,
      numOfItem: json['numOfItem'] as int?,
      sizeName: json['sizeName'] as String?,
      createdDate: json['createdDate'] as String?,
      priority: json['priority'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => PickProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      bins: (json['bins'] as List<dynamic>?)
          ?.map((e) => PickingBin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PickingPathToJson(PickingPath instance) =>
    <String, dynamic>{
      'pickListId': instance.pickListId,
      'pickListCode': instance.pickListCode,
      'pickSessionId': instance.pickSessionId,
      'numOfOR': instance.numOfOR,
      'numOfItem': instance.numOfItem,
      'sizeName': instance.sizeName,
      'createdDate': instance.createdDate,
      'priority': instance.priority,
      'products': instance.products,
      'bins': instance.bins,
    };
