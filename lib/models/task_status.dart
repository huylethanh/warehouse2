import 'package:json_annotation/json_annotation.dart';

part 'task_status.g.dart';

@JsonSerializable()
class TaskStatus {
  final int? status;
  final int? sessionId;
  final String? refObj;

  TaskStatus({
    this.status,
    this.sessionId,
    this.refObj,
  });

  factory TaskStatus.fromJson(Map<String, dynamic> json) =>
      _$TaskStatusFromJson(json);

  Map<String, dynamic> toJson() => _$TaskStatusToJson(this);
}
