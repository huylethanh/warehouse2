import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suggest_location.g.dart';

@CopyWith()
@JsonSerializable()
class SuggestLocation {
  final int? productId;
  final List<SuggestLocationItem>? items;
  final List<SuggestLocationItem>? configs;

  SuggestLocation({
    this.productId,
    this.items,
    this.configs,
  });

  factory SuggestLocation.fromJson(Map<String, dynamic> json) =>
      _$SuggestLocationFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestLocationToJson(this);
}

@CopyWith()
@JsonSerializable()
class SuggestLocationItem {
  final int? numOfSuggestedLocations;
  final String? numOfLocation;
  final String? unitId;
  final String? conditionTypeId;
  final int? productId;

  SuggestLocationItem({
    this.numOfSuggestedLocations,
    this.numOfLocation,
    this.unitId,
    this.conditionTypeId,
    this.productId,
  });

  factory SuggestLocationItem.fromJson(Map<String, dynamic> json) =>
      _$SuggestLocationItemFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestLocationItemToJson(this);
}

@CopyWith()
@JsonSerializable()
class SuggestLocationConfig {
  final String? objectType;
  final String? objectTypeName;
  final String? objectName;
  final int? objectId;
  final String? objectCode;
  final int? objectParentId;
  final String? objectParentCode;

  SuggestLocationConfig({
    this.objectType,
    this.objectCode,
    this.objectId,
    this.objectName,
    this.objectParentCode,
    this.objectParentId,
    this.objectTypeName,
  });

  factory SuggestLocationConfig.fromJson(Map<String, dynamic> json) =>
      _$SuggestLocationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestLocationConfigToJson(this);
}
