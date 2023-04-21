import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'partner_cycle_count.g.dart';

@CopyWith()
@JsonSerializable()
class PartnerCycleCount {
  int? cycleCountId;
  String? cycleCountCode;
  int? cycleCountType;
  String? partnerCode;
  String? partnerName;
  int? totalProduct;
  String? createdDate;
  List<CycleCountLocation>? cycleCountLocations;

  PartnerCycleCount({
    this.cycleCountId,
    this.cycleCountCode,
    this.cycleCountType,
    this.partnerCode,
    this.partnerName,
    this.totalProduct,
    this.createdDate,
    this.cycleCountLocations,
  });

  PartnerCycleCountView toView() {
    return PartnerCycleCountView(
        cycleCountId,
        partnerName,
        partnerCode,
        createdDate,
        cycleCountType,
        totalProduct,
        cycleCountCode,
        cycleCountLocations);
  }

  factory PartnerCycleCount.fromJson(Map<String, dynamic> json) =>
      _$PartnerCycleCountFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerCycleCountToJson(this);
}
