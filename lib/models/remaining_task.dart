import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'remaining_task.g.dart';

@JsonSerializable()
@CopyWith()
class RemainingTask {
  final int? sessionId;

  RemainingTask({this.sessionId});

  factory RemainingTask.fromJson(Map<String, dynamic> json) =>
      _$RemainingTaskFromJson(json);

  Map<String, dynamic> toJson() => _$RemainingTaskToJson(this);
}

@JsonSerializable()
@CopyWith()
class PickUpTask extends RemainingTask {
  @JsonKey(name: "pickListId")
  final int? id;
  @JsonKey(name: "pickListCode")
  final String? code;
  final bool? isRepick;

  PickUpTask({super.sessionId, this.id, this.code, this.isRepick});

  bool isReturnReceive() {
    return isRepick == true;
  }

  factory PickUpTask.fromJson(Map<String, dynamic> json) =>
      _$PickUpTaskFromJson(json);

  Map<String, dynamic> toJson() => _$PickUpTaskToJson(this);
}

@JsonSerializable()
@CopyWith()
class ReceiveTask extends RemainingTask {
  final String? checkInSessionCode;
  final int? irId;
  final String? irCode;
  final int? irType;
  final int? orId;
  final String? startTime;
  final String? partnerCode;
  final String? partnerShortName;
  final String? locationCode;
  final ConditionType? conditionType;

  ReceiveTask({
    super.sessionId,
    this.checkInSessionCode,
    this.irId,
    this.irCode,
    this.irType,
    this.orId,
    this.startTime,
    this.partnerCode,
    this.partnerShortName,
    this.locationCode,
    this.conditionType,
  });

  bool isReturn() {
    return irType == 3;
  }

  factory ReceiveTask.fromJson(Map<String, dynamic> json) =>
      _$ReceiveTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveTaskToJson(this);

  ReceiveModel toReceiveModel() {
    return ReceiveModel(
      irId: irId,
      code: checkInSessionCode,
      shortName: partnerShortName,
      createdDate: DateTime.tryParse(startTime ?? ""),
      irCode: irCode,
      partnerCode: partnerCode,
    );
  }
}

@JsonSerializable()
@CopyWith()
class PutAwayTask extends RemainingTask {
  final String? startTime;
  final int? locationId;
  final String? locationCode;
  final String? partnerName;
  final double? totalWeight;

  PutAwayTask({
    super.sessionId,
    this.startTime,
    this.locationCode,
    this.locationId,
    this.partnerName,
    this.totalWeight,
  });

  factory PutAwayTask.fromJson(Map<String, dynamic> json) =>
      _$PutAwayTaskFromJson(json);

  Map<String, dynamic> toJson() => _$PutAwayTaskToJson(this);
}

@JsonSerializable()
@CopyWith()
class TransferTask extends RemainingTask {
  final String? srcLocationCode;
  final String? dstLocationCode;
  final String? startTime;

  TransferTask({
    super.sessionId,
    this.srcLocationCode,
    this.dstLocationCode,
    this.startTime,
  });

  factory TransferTask.fromJson(Map<String, dynamic> json) =>
      _$TransferTaskFromJson(json);

  Map<String, dynamic> toJson() => _$TransferTaskToJson(this);
}

@JsonSerializable()
@CopyWith()
class EqcTask extends RemainingTask {
  final String? startTime;
  final int? locationId;
  final String? locationCode;

  EqcTask({
    super.sessionId,
    this.startTime,
    this.locationId,
    this.locationCode,
  });

  factory EqcTask.fromJson(Map<String, dynamic> json) =>
      _$EqcTaskFromJson(json);

  Map<String, dynamic> toJson() => _$EqcTaskToJson(this);
}

@JsonSerializable()
@CopyWith()
class RandomCountTask extends RemainingTask {
  final String? startTime;
  final String? cycleCountCode;

  RandomCountTask({
    super.sessionId,
    this.startTime,
    this.cycleCountCode,
  });

  factory RandomCountTask.fromJson(Map<String, dynamic> json) =>
      _$RandomCountTaskFromJson(json);

  Map<String, dynamic> toJson() => _$RandomCountTaskToJson(this);
}

@JsonSerializable()
@CopyWith()
class CycleCountTask extends RemainingTask {
  final String? cycleCountCode;
  final int? cycleCountId;
  final bool? needToVerify;
  final int? cycleCountType;

  CycleCountTask({
    super.sessionId,
    this.cycleCountCode,
    this.cycleCountId,
    this.needToVerify,
    this.cycleCountType,
  });

  bool isVerify() {
    return needToVerify == true;
  }

  factory CycleCountTask.fromJson(Map<String, dynamic> json) =>
      _$CycleCountTaskFromJson(json);

  Map<String, dynamic> toJson() => _$CycleCountTaskToJson(this);
}

class None extends RemainingTask {}
