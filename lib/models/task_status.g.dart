// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskStatus _$TaskStatusFromJson(Map<String, dynamic> json) => TaskStatus(
      status: json['status'] as int?,
      sessionId: json['sessionId'] as int?,
      refObj: json['refObj'] as String?,
    );

Map<String, dynamic> _$TaskStatusToJson(TaskStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sessionId': instance.sessionId,
      'refObj': instance.refObj,
    };
