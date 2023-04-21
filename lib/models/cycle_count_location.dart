import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'cycle_count_location.g.dart';

@CopyWith()
@JsonSerializable()
class CycleCountLocation {
  final int? cycleCountId;
  final int? cycleCountLocationId;
  final String? locationCode;
  final int totalQty;
  final int totalCountingQty;
  final int totalDifferentQty;

  CycleCountLocation({
    this.cycleCountId,
    this.cycleCountLocationId,
    this.locationCode,
    this.totalQty = 0,
    this.totalCountingQty = 0,
    this.totalDifferentQty = 0,
  });

  CycleCountLocationItem toView() {
    return CycleCountLocationItem(0, cycleCountId, cycleCountLocationId,
        locationCode, totalQty, totalCountingQty, totalDifferentQty);
  }

  factory CycleCountLocation.fromJson(Map<String, dynamic> json) =>
      _$CycleCountLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CycleCountLocationToJson(this);
}
