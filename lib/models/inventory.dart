import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/models.dart';

part 'inventory.g.dart';

@JsonSerializable()
@CopyWith()
class Inventory {
  final String? locationCode;
  final String? status;
  final String? physicalType;
  final String? updatedDate;
  final int? updatedBy;
  final String? updatedByName;
  final int? maxNumberSKU;
  final int? currentNumberSKU;
  final List<StoringProduct>? items;

  Inventory({
    this.locationCode,
    this.status,
    this.physicalType,
    this.updatedDate,
    this.updatedBy,
    this.updatedByName,
    this.maxNumberSKU,
    this.currentNumberSKU,
    this.items,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) =>
      _$InventoryFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryToJson(this);
}
