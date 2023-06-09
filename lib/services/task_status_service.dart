import 'dart:convert';

import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/result_set.dart';
import 'package:warehouse_app/services/service_base.dart';

class TaskStatusService extends ServiceBase {
  Future<ResultSet<RemainingTask?>> getTaskStatus() async {
    final res = await client.taskStatus();

    if (res.isSuccessful) {
      return ResultSet.success(_convertTask(res.body!));
    }

    return ResultSet.error(res.error);
  }

  RemainingTask? _convertTask(TaskStatus status) {
    if (status.refObj == null) {
      return null;
    }

    final jsonObject = json.decode(status.refObj!);

    switch (status.status) {
      case 2:
        var task = ReceiveTask.fromJson(jsonObject);
        task = task.copyWith(sessionId: status.sessionId);
        return task;

      case 3:
        var task = PutAwayTask.fromJson(jsonObject);
        task = task.copyWith(sessionId: status.sessionId);
        return task;

      case 4:
        var task = PickUpTask.fromJson(jsonObject);
        task = task.copyWith(sessionId: status.sessionId);
        return task;

      case 6:
        var task = TransferTask.fromJson(jsonObject);
        task = task.copyWith(sessionId: status.sessionId);
        return task;

      case 7:
        var task = EqcTask.fromJson(jsonObject);
        task = task.copyWith(sessionId: status.sessionId);
        return task;

      case 9:
        var task = CycleCountTask.fromJson(jsonObject);
        task = task.copyWith(sessionId: status.sessionId);
        return task;

      default:
        return null;
    }
  }
}
