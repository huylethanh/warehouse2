import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/screens/index.dart';
import 'package:warehouse_app/services/index.dart';
import 'package:warehouse_app/utils/index.dart';
import 'package:warehouse_app/view_models/view_model_base.dart';
import 'package:warehouse_app/widgets/index.dart';

class ViewNames {
  static const String receiveList = "ReceiveList";
  static const String putAway = "PutAway";
  static const String picking = "Picking";
  static const String transfer = "Transfer";
}

class HomeScreenViewModel extends ViewModelBase {
  final _service = TaskStatusService();
  RemainingTask? _remaining = null;

  void logout(BuildContext context) {
    LoginReference().clearAll();

    Navigator.pushNamedAndRemoveUntil(
        context, Routing.login, (Route<dynamic> route) => false);
  }

  void init() {
    _loadTaskStatus();
  }

  void _loadTaskStatus() async {
    setBusy(true);

    final status = await _service.getTaskStatus();

    if (!status.hasError) {
      _remaining = status.data;
      setBusy(false);

      return;
    }

    investigateError(status.errorMessage, () => setBusy(false));
  }

  Widget showTaskView(BuildContext context) {
    if (_remaining == null) {
      return const SizedBox();
    }

    if (_remaining is PickUpTask) {
      final cast = _remaining as PickUpTask;
      return _taskView(
        taskName: "Lấy hàng",
        taskCode: cast.code!,
        onPressed: () {},
      );
    }

    if (_remaining is PutAwayTask) {
      final cast = _remaining as PutAwayTask;
      return _taskView(
        taskName: "Lưu Kho",
        taskCode: cast.startTime!,
        onPressed: () {
          goToRemaining(context, _remaining!, ViewNames.putAway);
        },
      );
    }

    if (_remaining is ReceiveTask) {
      final cast = _remaining as ReceiveTask;
      final text = cast.isReturn() ? "Nhận hàng trả" : "Nhận hàng";
      return _taskView(
        taskName: text,
        taskCode: cast.checkInSessionCode!,
        onPressed: () {
          goToRemaining(context, _remaining!, ViewNames.receiveList);
        },
      );
    }

    if (_remaining is TransferTask) {
      final cast = _remaining as TransferTask;

      return _taskView(
        taskName: "Luân chuyển",
        taskCode: cast.startTime ?? "N/A",
        onPressed: () {},
      );
    }

    if (_remaining is EqcTask) {
      final cast = _remaining as EqcTask;

      return _taskView(
        taskName: "Lưu kho hàng hủy",
        taskCode: cast.startTime ?? "N/A",
        onPressed: () {},
      );
    }

    if (_remaining is RandomCountTask) {
      final cast = _remaining as RandomCountTask;

      return _taskView(
        taskName: "Kiểm kê ngẫu nhiên",
        taskCode: cast.cycleCountCode!,
        onPressed: () {},
      );
    }

    if (_remaining is CycleCountTask) {
      final cast = _remaining as CycleCountTask;
      final name = cast.isVerify() ? "Xác nhận kiểm kê" : "Kiểm kê ngẫu nhiên";
      return _taskView(
        taskName: name,
        taskCode: cast.cycleCountCode!,
        onPressed: () {},
      );
    }

    return const SizedBox();
  }

  goToScreen(BuildContext context, String viewName) {
    // if (_remaining == null) {
    late Widget view;

    switch (viewName) {
      case ViewNames.receiveList:
        view = const ReceiveListScreen();
        break;

      case ViewNames.putAway:
        // view = const PutAwayScreen();
        break;
    }

    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return view;
      },
    ));

    return;
    // }

    goToRemaining(context, _remaining!, viewName);
  }

  void goToRemaining(
      BuildContext context, RemainingTask task, String viewName) {
    Widget? view;

    if (viewName == ViewNames.receiveList) {
      if (task is ReceiveTask) {
        final converted = task;
        view = ReceiveSessionScreen(
          conditionType: converted.conditionType!,
          receiveModel: converted.toReceiveModel(),
          receiveTask: task,
        );
      }
    }

    if (viewName == ViewNames.putAway) {
      if (task is PutAwayTask) {
        final converted = task;
        //    view = PutAwayScreen();
      }
    }

    if (view == null) {
      return;
    }

    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return view!;
      },
    ));
  }

  Widget _taskView(
      {required String taskName,
      required String taskCode,
      required void Function() onPressed}) {
    return RoundedContainer(
      backgroundColor: Colors.amber,
      innerPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  taskCode,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: onPressed, child: const Text("Continue"))
        ],
      ),
    );
  }
}
