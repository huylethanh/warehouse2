// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_location.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SuggestLocationCWProxy {
  SuggestLocation configs(List<SuggestLocationItem>? configs);

  SuggestLocation items(List<SuggestLocationItem>? items);

  SuggestLocation productId(int? productId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SuggestLocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SuggestLocation(...).copyWith(id: 12, name: "My name")
  /// ````
  SuggestLocation call({
    List<SuggestLocationItem>? configs,
    List<SuggestLocationItem>? items,
    int? productId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSuggestLocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSuggestLocation.copyWith.fieldName(...)`
class _$SuggestLocationCWProxyImpl implements _$SuggestLocationCWProxy {
  final SuggestLocation _value;

  const _$SuggestLocationCWProxyImpl(this._value);

  @override
  SuggestLocation configs(List<SuggestLocationItem>? configs) =>
      this(configs: configs);

  @override
  SuggestLocation items(List<SuggestLocationItem>? items) => this(items: items);

  @override
  SuggestLocation productId(int? productId) => this(productId: productId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SuggestLocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SuggestLocation(...).copyWith(id: 12, name: "My name")
  /// ````
  SuggestLocation call({
    Object? configs = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? productId = const $CopyWithPlaceholder(),
  }) {
    return SuggestLocation(
      configs: configs == const $CopyWithPlaceholder()
          ? _value.configs
          // ignore: cast_nullable_to_non_nullable
          : configs as List<SuggestLocationItem>?,
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<SuggestLocationItem>?,
      productId: productId == const $CopyWithPlaceholder()
          ? _value.productId
          // ignore: cast_nullable_to_non_nullable
          : productId as int?,
    );
  }
}

extension $SuggestLocationCopyWith on SuggestLocation {
  /// Returns a callable class that can be used as follows: `instanceOfSuggestLocation.copyWith(...)` or like so:`instanceOfSuggestLocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SuggestLocationCWProxy get copyWith => _$SuggestLocationCWProxyImpl(this);
}

abstract class _$SuggestLocationItemCWProxy {
  SuggestLocationItem conditionTypeId(String? conditionTypeId);

  SuggestLocationItem numOfLocation(String? numOfLocation);

  SuggestLocationItem numOfSuggestedLocations(int? numOfSuggestedLocations);

  SuggestLocationItem productId(int? productId);

  SuggestLocationItem unitId(String? unitId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SuggestLocationItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SuggestLocationItem(...).copyWith(id: 12, name: "My name")
  /// ````
  SuggestLocationItem call({
    String? conditionTypeId,
    String? numOfLocation,
    int? numOfSuggestedLocations,
    int? productId,
    String? unitId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSuggestLocationItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSuggestLocationItem.copyWith.fieldName(...)`
class _$SuggestLocationItemCWProxyImpl implements _$SuggestLocationItemCWProxy {
  final SuggestLocationItem _value;

  const _$SuggestLocationItemCWProxyImpl(this._value);

  @override
  SuggestLocationItem conditionTypeId(String? conditionTypeId) =>
      this(conditionTypeId: conditionTypeId);

  @override
  SuggestLocationItem numOfLocation(String? numOfLocation) =>
      this(numOfLocation: numOfLocation);

  @override
  SuggestLocationItem numOfSuggestedLocations(int? numOfSuggestedLocations) =>
      this(numOfSuggestedLocations: numOfSuggestedLocations);

  @override
  SuggestLocationItem productId(int? productId) => this(productId: productId);

  @override
  SuggestLocationItem unitId(String? unitId) => this(unitId: unitId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SuggestLocationItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SuggestLocationItem(...).copyWith(id: 12, name: "My name")
  /// ````
  SuggestLocationItem call({
    Object? conditionTypeId = const $CopyWithPlaceholder(),
    Object? numOfLocation = const $CopyWithPlaceholder(),
    Object? numOfSuggestedLocations = const $CopyWithPlaceholder(),
    Object? productId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
  }) {
    return SuggestLocationItem(
      conditionTypeId: conditionTypeId == const $CopyWithPlaceholder()
          ? _value.conditionTypeId
          // ignore: cast_nullable_to_non_nullable
          : conditionTypeId as String?,
      numOfLocation: numOfLocation == const $CopyWithPlaceholder()
          ? _value.numOfLocation
          // ignore: cast_nullable_to_non_nullable
          : numOfLocation as String?,
      numOfSuggestedLocations:
          numOfSuggestedLocations == const $CopyWithPlaceholder()
              ? _value.numOfSuggestedLocations
              // ignore: cast_nullable_to_non_nullable
              : numOfSuggestedLocations as int?,
      productId: productId == const $CopyWithPlaceholder()
          ? _value.productId
          // ignore: cast_nullable_to_non_nullable
          : productId as int?,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String?,
    );
  }
}

extension $SuggestLocationItemCopyWith on SuggestLocationItem {
  /// Returns a callable class that can be used as follows: `instanceOfSuggestLocationItem.copyWith(...)` or like so:`instanceOfSuggestLocationItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SuggestLocationItemCWProxy get copyWith =>
      _$SuggestLocationItemCWProxyImpl(this);
}

abstract class _$SuggestLocationConfigCWProxy {
  SuggestLocationConfig objectCode(String? objectCode);

  SuggestLocationConfig objectId(int? objectId);

  SuggestLocationConfig objectName(String? objectName);

  SuggestLocationConfig objectParentCode(String? objectParentCode);

  SuggestLocationConfig objectParentId(int? objectParentId);

  SuggestLocationConfig objectType(String? objectType);

  SuggestLocationConfig objectTypeName(String? objectTypeName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SuggestLocationConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SuggestLocationConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  SuggestLocationConfig call({
    String? objectCode,
    int? objectId,
    String? objectName,
    String? objectParentCode,
    int? objectParentId,
    String? objectType,
    String? objectTypeName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSuggestLocationConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSuggestLocationConfig.copyWith.fieldName(...)`
class _$SuggestLocationConfigCWProxyImpl
    implements _$SuggestLocationConfigCWProxy {
  final SuggestLocationConfig _value;

  const _$SuggestLocationConfigCWProxyImpl(this._value);

  @override
  SuggestLocationConfig objectCode(String? objectCode) =>
      this(objectCode: objectCode);

  @override
  SuggestLocationConfig objectId(int? objectId) => this(objectId: objectId);

  @override
  SuggestLocationConfig objectName(String? objectName) =>
      this(objectName: objectName);

  @override
  SuggestLocationConfig objectParentCode(String? objectParentCode) =>
      this(objectParentCode: objectParentCode);

  @override
  SuggestLocationConfig objectParentId(int? objectParentId) =>
      this(objectParentId: objectParentId);

  @override
  SuggestLocationConfig objectType(String? objectType) =>
      this(objectType: objectType);

  @override
  SuggestLocationConfig objectTypeName(String? objectTypeName) =>
      this(objectTypeName: objectTypeName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SuggestLocationConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SuggestLocationConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  SuggestLocationConfig call({
    Object? objectCode = const $CopyWithPlaceholder(),
    Object? objectId = const $CopyWithPlaceholder(),
    Object? objectName = const $CopyWithPlaceholder(),
    Object? objectParentCode = const $CopyWithPlaceholder(),
    Object? objectParentId = const $CopyWithPlaceholder(),
    Object? objectType = const $CopyWithPlaceholder(),
    Object? objectTypeName = const $CopyWithPlaceholder(),
  }) {
    return SuggestLocationConfig(
      objectCode: objectCode == const $CopyWithPlaceholder()
          ? _value.objectCode
          // ignore: cast_nullable_to_non_nullable
          : objectCode as String?,
      objectId: objectId == const $CopyWithPlaceholder()
          ? _value.objectId
          // ignore: cast_nullable_to_non_nullable
          : objectId as int?,
      objectName: objectName == const $CopyWithPlaceholder()
          ? _value.objectName
          // ignore: cast_nullable_to_non_nullable
          : objectName as String?,
      objectParentCode: objectParentCode == const $CopyWithPlaceholder()
          ? _value.objectParentCode
          // ignore: cast_nullable_to_non_nullable
          : objectParentCode as String?,
      objectParentId: objectParentId == const $CopyWithPlaceholder()
          ? _value.objectParentId
          // ignore: cast_nullable_to_non_nullable
          : objectParentId as int?,
      objectType: objectType == const $CopyWithPlaceholder()
          ? _value.objectType
          // ignore: cast_nullable_to_non_nullable
          : objectType as String?,
      objectTypeName: objectTypeName == const $CopyWithPlaceholder()
          ? _value.objectTypeName
          // ignore: cast_nullable_to_non_nullable
          : objectTypeName as String?,
    );
  }
}

extension $SuggestLocationConfigCopyWith on SuggestLocationConfig {
  /// Returns a callable class that can be used as follows: `instanceOfSuggestLocationConfig.copyWith(...)` or like so:`instanceOfSuggestLocationConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SuggestLocationConfigCWProxy get copyWith =>
      _$SuggestLocationConfigCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestLocation _$SuggestLocationFromJson(Map<String, dynamic> json) =>
    SuggestLocation(
      productId: json['productId'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => SuggestLocationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      configs: (json['configs'] as List<dynamic>?)
          ?.map((e) => SuggestLocationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuggestLocationToJson(SuggestLocation instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'items': instance.items,
      'configs': instance.configs,
    };

SuggestLocationItem _$SuggestLocationItemFromJson(Map<String, dynamic> json) =>
    SuggestLocationItem(
      numOfSuggestedLocations: json['numOfSuggestedLocations'] as int?,
      numOfLocation: json['numOfLocation'] as String?,
      unitId: json['unitId'] as String?,
      conditionTypeId: json['conditionTypeId'] as String?,
      productId: json['productId'] as int?,
    );

Map<String, dynamic> _$SuggestLocationItemToJson(
        SuggestLocationItem instance) =>
    <String, dynamic>{
      'numOfSuggestedLocations': instance.numOfSuggestedLocations,
      'numOfLocation': instance.numOfLocation,
      'unitId': instance.unitId,
      'conditionTypeId': instance.conditionTypeId,
      'productId': instance.productId,
    };

SuggestLocationConfig _$SuggestLocationConfigFromJson(
        Map<String, dynamic> json) =>
    SuggestLocationConfig(
      objectType: json['objectType'] as String?,
      objectCode: json['objectCode'] as String?,
      objectId: json['objectId'] as int?,
      objectName: json['objectName'] as String?,
      objectParentCode: json['objectParentCode'] as String?,
      objectParentId: json['objectParentId'] as int?,
      objectTypeName: json['objectTypeName'] as String?,
    );

Map<String, dynamic> _$SuggestLocationConfigToJson(
        SuggestLocationConfig instance) =>
    <String, dynamic>{
      'objectType': instance.objectType,
      'objectTypeName': instance.objectTypeName,
      'objectName': instance.objectName,
      'objectId': instance.objectId,
      'objectCode': instance.objectCode,
      'objectParentId': instance.objectParentId,
      'objectParentCode': instance.objectParentCode,
    };
