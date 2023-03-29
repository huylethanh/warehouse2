// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'or_picking.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ORPickingCWProxy {
  ORPicking code(String? code);

  ORPicking createdDate(String? createdDate);

  ORPicking id(int? id);

  ORPicking numOfTransport(int? numOfTransport);

  ORPicking orderCount(int? orderCount);

  ORPicking priority(int? priority);

  ORPicking productCount(int? productCount);

  ORPicking sizeNam(String? sizeNam);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ORPicking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ORPicking(...).copyWith(id: 12, name: "My name")
  /// ````
  ORPicking call({
    String? code,
    String? createdDate,
    int? id,
    int? numOfTransport,
    int? orderCount,
    int? priority,
    int? productCount,
    String? sizeNam,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfORPicking.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfORPicking.copyWith.fieldName(...)`
class _$ORPickingCWProxyImpl implements _$ORPickingCWProxy {
  final ORPicking _value;

  const _$ORPickingCWProxyImpl(this._value);

  @override
  ORPicking code(String? code) => this(code: code);

  @override
  ORPicking createdDate(String? createdDate) => this(createdDate: createdDate);

  @override
  ORPicking id(int? id) => this(id: id);

  @override
  ORPicking numOfTransport(int? numOfTransport) =>
      this(numOfTransport: numOfTransport);

  @override
  ORPicking orderCount(int? orderCount) => this(orderCount: orderCount);

  @override
  ORPicking priority(int? priority) => this(priority: priority);

  @override
  ORPicking productCount(int? productCount) => this(productCount: productCount);

  @override
  ORPicking sizeNam(String? sizeNam) => this(sizeNam: sizeNam);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ORPicking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ORPicking(...).copyWith(id: 12, name: "My name")
  /// ````
  ORPicking call({
    Object? code = const $CopyWithPlaceholder(),
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? numOfTransport = const $CopyWithPlaceholder(),
    Object? orderCount = const $CopyWithPlaceholder(),
    Object? priority = const $CopyWithPlaceholder(),
    Object? productCount = const $CopyWithPlaceholder(),
    Object? sizeNam = const $CopyWithPlaceholder(),
  }) {
    return ORPicking(
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      createdDate: createdDate == const $CopyWithPlaceholder()
          ? _value.createdDate
          // ignore: cast_nullable_to_non_nullable
          : createdDate as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      numOfTransport: numOfTransport == const $CopyWithPlaceholder()
          ? _value.numOfTransport
          // ignore: cast_nullable_to_non_nullable
          : numOfTransport as int?,
      orderCount: orderCount == const $CopyWithPlaceholder()
          ? _value.orderCount
          // ignore: cast_nullable_to_non_nullable
          : orderCount as int?,
      priority: priority == const $CopyWithPlaceholder()
          ? _value.priority
          // ignore: cast_nullable_to_non_nullable
          : priority as int?,
      productCount: productCount == const $CopyWithPlaceholder()
          ? _value.productCount
          // ignore: cast_nullable_to_non_nullable
          : productCount as int?,
      sizeNam: sizeNam == const $CopyWithPlaceholder()
          ? _value.sizeNam
          // ignore: cast_nullable_to_non_nullable
          : sizeNam as String?,
    );
  }
}

extension $ORPickingCopyWith on ORPicking {
  /// Returns a callable class that can be used as follows: `instanceOfORPicking.copyWith(...)` or like so:`instanceOfORPicking.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ORPickingCWProxy get copyWith => _$ORPickingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ORPicking _$ORPickingFromJson(Map<String, dynamic> json) => ORPicking(
      id: json['pickListId'] as int?,
      code: json['pickListCode'] as String?,
      orderCount: json['numOfOR'] as int?,
      productCount: json['numOfItem'] as int?,
      sizeNam: json['sizeNam'] as String?,
      createdDate: json['createdDate'] as String?,
      numOfTransport: json['numOfTransport'] as int?,
      priority: json['priority'] as int?,
    );

Map<String, dynamic> _$ORPickingToJson(ORPicking instance) => <String, dynamic>{
      'pickListId': instance.id,
      'pickListCode': instance.code,
      'numOfOR': instance.orderCount,
      'numOfItem': instance.productCount,
      'sizeNam': instance.sizeNam,
      'createdDate': instance.createdDate,
      'numOfTransport': instance.numOfTransport,
      'priority': instance.priority,
    };
