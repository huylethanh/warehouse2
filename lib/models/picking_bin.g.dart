// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picking_bin.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PickingBinCWProxy {
  PickingBin bin(String? bin);

  PickingBin canPickAll(bool? canPickAll);

  PickingBin id(int? id);

  PickingBin pickList(List<PickingItem>? pickList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickingBin(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickingBin(...).copyWith(id: 12, name: "My name")
  /// ````
  PickingBin call({
    String? bin,
    bool? canPickAll,
    int? id,
    List<PickingItem>? pickList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPickingBin.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPickingBin.copyWith.fieldName(...)`
class _$PickingBinCWProxyImpl implements _$PickingBinCWProxy {
  final PickingBin _value;

  const _$PickingBinCWProxyImpl(this._value);

  @override
  PickingBin bin(String? bin) => this(bin: bin);

  @override
  PickingBin canPickAll(bool? canPickAll) => this(canPickAll: canPickAll);

  @override
  PickingBin id(int? id) => this(id: id);

  @override
  PickingBin pickList(List<PickingItem>? pickList) => this(pickList: pickList);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PickingBin(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PickingBin(...).copyWith(id: 12, name: "My name")
  /// ````
  PickingBin call({
    Object? bin = const $CopyWithPlaceholder(),
    Object? canPickAll = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? pickList = const $CopyWithPlaceholder(),
  }) {
    return PickingBin(
      bin: bin == const $CopyWithPlaceholder()
          ? _value.bin
          // ignore: cast_nullable_to_non_nullable
          : bin as String?,
      canPickAll: canPickAll == const $CopyWithPlaceholder()
          ? _value.canPickAll
          // ignore: cast_nullable_to_non_nullable
          : canPickAll as bool?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      pickList: pickList == const $CopyWithPlaceholder()
          ? _value.pickList
          // ignore: cast_nullable_to_non_nullable
          : pickList as List<PickingItem>?,
    );
  }
}

extension $PickingBinCopyWith on PickingBin {
  /// Returns a callable class that can be used as follows: `instanceOfPickingBin.copyWith(...)` or like so:`instanceOfPickingBin.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PickingBinCWProxy get copyWith => _$PickingBinCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickingBin _$PickingBinFromJson(Map<String, dynamic> json) => PickingBin(
      id: json['binLocationId'] as int?,
      bin: json['binLocationCode'] as String?,
      pickList: (json['pickingActions'] as List<dynamic>?)
          ?.map((e) => PickingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      canPickAll: json['isGetFullBin'] as bool?,
    );

Map<String, dynamic> _$PickingBinToJson(PickingBin instance) =>
    <String, dynamic>{
      'binLocationId': instance.id,
      'binLocationCode': instance.bin,
      'pickingActions': instance.pickList,
      'isGetFullBin': instance.canPickAll,
    };
