import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/models.dart';

part 'condition_type.g.dart';

@JsonSerializable()
class ConditionType {
  final int? conditionTypeId;
  final String? conditionTypeCode;
  final String? conditionTypeName;
  final bool? isException;
  final bool? isExpiredDate;
  final int? partnerId;

  ConditionType({
    this.conditionTypeId,
    this.conditionTypeCode,
    this.conditionTypeName,
    this.isException,
    this.isExpiredDate,
    this.partnerId,
  });

  factory ConditionType.fromJson(Map<String, dynamic> json) =>
      _$ConditionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionTypeToJson(this);

  Condition get condition {
    if (conditionTypeId == 1) {
      return Condition.conditionNew;
    }

    return Condition.conditionOld;
  }

  bool get isNew {
    return conditionTypeId == 1;
  }
}
