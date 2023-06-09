// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/models/cycle_count_constain.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/cycle_counts/cycle_count_selection_view.dart';
import 'package:warehouse_app/screens/cycle_counts/screen_daily/daily_cycle_count_screen.dart';
import 'package:warehouse_app/screens/cycle_counts/screen_daily/daily_verify_cycle_count_screen.dart';
import 'package:warehouse_app/screens/index.dart';
import 'package:warehouse_app/screens/picking/picking.dart';
import 'package:warehouse_app/screens/repick/repick_screen_view_model.dart';
import 'package:warehouse_app/screens/transfer/transfer.dart';
import 'package:warehouse_app/services/task_status_service.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import '../put_away/put_away_screen.dart';
import '../receive/receive.dart';
import '../repick/repick.dart';

class HomeScreenViewModel extends ViewModelBase {
  final _service = TaskStatusService();
  RemainingTask? _remaining = null;

  static const String receive = "receive"; // 1
  static const String putAway = "putAway"; //2
  static const String picking = "picking"; //3
  static const String repicking = "repicking"; //3
  static const String transfer = "transfer"; //4
  static const String audit = "audit";
  static const String handOver = "handOver";

  static const String eqc = "Eqc";
  static const String returnProdcut = "Return";
  static const String repick = "Repick";
  static const String cycleCount = "RandomCount"; //8
  static const String verifyCycleCount = "VerifyCycleCount"; //9

  int selectedIndex = 0;

  final List views = [];

  void init() {
    _initMeunu();
    _loadTaskStatus();
  }

  void _initMeunu() {
    views.add(
      {"name": receive, "icon": FontAwesomeIcons.box, "color": Colors.green},
    );
    views.add(
      {
        "name": putAway,
        "icon": FontAwesomeIcons.boxesStacked,
        "color": Colors.deepOrange
      },
    );
    views.add(
      {
        "name": picking,
        "icon": FontAwesomeIcons.truckFast,
        "color": Colors.indigoAccent
      },
    );
    views.add(
      {
        "name": repicking,
        "icon": FontAwesomeIcons.truckFast,
        "color": Colors.grey
      },
    );
    views.add(
      {
        "name": transfer,
        "icon": FontAwesomeIcons.peopleCarryBox,
        "color": Colors.orangeAccent
      },
    );

    views.add(
      {
        "name": cycleCount,
        "icon": FontAwesomeIcons.checkToSlot,
        "color": Colors.blueGrey
      },
    );
    views.add(
      {
        "name": verifyCycleCount,
        "icon": FontAwesomeIcons.checkToSlot,
        "color": Colors.blueGrey.shade600
      },
    );
    views.add(
      {
        "name": handOver,
        "icon": FontAwesomeIcons.listCheck,
        "color": Colors.blueAccent
      },
    );
  }

  onSelectedView(BuildContext context, String name) {
    final checked = _checkAction(context, name);

    if (checked == null) {
      return;
    }

    if (checked == false) {
      DialogService.showWarningBotToast("Bạn còn công việc chưa hoàn thành.");
      return;
    }

    late Widget page;
    switch (name) {
      case receive:
        page = const ReceiveListScreen();
        break;

      case putAway:
        page = const PutAwayScreen();
        break;

      case picking:
        page = const PickingListScreen();
        break;

      case repicking:
        page = const RepickScreen();
        break;

      case transfer:
        page = const TransferScreen();
        break;

      case cycleCount:
      case verifyCycleCount:
        _showBottomsheet(context, name);
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }

  void _showBottomsheet(BuildContext context, String name) {
    late Widget content;
    late String title;
    switch (name) {
      case cycleCount:
        content = const CycleCountSelectionView();
        title = "Vui lòng chòn loại kiểm kê";
        break;

      case verifyCycleCount:
        title = "Vui lòng chòn loại xác nhận";
        content = const CycleCountSelectionView(
          isCycleCount: true,
        );
        break;
      default:
    }

    DialogService.showBottomSheet(context,
        chid: content, title: title, canDismiss: false);
  }

  String getName(String name) {
    switch (name) {
      case receive:
        return "Nhận Hàng";

      case putAway:
        return "Lưu Kho";

      case picking:
        return "Lấy Hàng";

      case repicking:
        return "Lấy Lại Hàng";

      case transfer:
        return "Luân Chuyển";

      case cycleCount:
        return "Kiểm Kê";

      case verifyCycleCount:
        return "Xác Nhận Kiểm Kê";

      case handOver:
        return "Bàn Giao";

      default:
        throw Exception("Not support the name: $name");
    }
  }

  void _loadTaskStatus() async {
    setBusy(true);

    final status = await _service.getTaskStatus();

    if (!status.hasError) {
      _remaining = status.data;
    }

    setBusy(false);
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
        onPressed: () {
          goToRemaining(context, _remaining!, picking);
        },
      );
    }

    if (_remaining is PutAwayTask) {
      final cast = _remaining as PutAwayTask;
      return _taskView(
        taskName: "Lưu Kho",
        taskCode: cast.startTime!,
        onPressed: () {
          goToRemaining(context, _remaining!, putAway);
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
          goToRemaining(context, _remaining!, receive);
        },
      );
    }

    if (_remaining is TransferTask) {
      final cast = _remaining as TransferTask;

      return _taskView(
        taskName: "Luân chuyển",
        taskCode: cast.startTime ?? "N/A",
        onPressed: () {
          goToRemaining(context, _remaining!, transfer);
        },
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
      var name = "";
      if (cast.isVerify()) {
        switch (cast.cycleCountType) {
          case DAILY:
            name = "Xác nhận kiểm kê thường nhật";
            break;
          case SKU:
            name = "Xác nhận kiểm kê theo sản phẩm";
            break;
          default:
            {
              DialogService.showWarningBotToast(
                  "Không hổ trợ xác nhận kiểm kê khác");
              return const SizedBox();
            }
        }
      } else {
        switch (cast.cycleCountType) {
          case DAILY:
            name = "Kiểm kê thường nhật";
            break;

          case SKU:
            name = "Kiểm kê theo sản phẩm";
            break;
          default:
            {
              DialogService.showWarningBotToast(
                  "Không hổ trợ xác kiểm kê khác");
              return const SizedBox();
            }
        }
      }

      return _taskView(
        taskName: name,
        taskCode: cast.cycleCountCode!,
        onPressed: () {
          goToRemaining(context, _remaining!, cycleCount);
        },
      );
    }

    return const SizedBox();
  }

  void goToRemaining(
      BuildContext context, RemainingTask task, String viewName) async {
    Widget? view;

    switch (viewName) {
      case receive:
        if (task is ReceiveTask) {
          final converted = task;
          view = ReceiveSessionScreen(
            conditionType: converted.conditionType!,
            receiveModel: converted.toReceiveModel(),
            receiveTask: task,
          );
        }
        break;

      case putAway:
        if (task is PutAwayTask) {
          view = PutAwayScreen(
            resumeTask: task,
          );
        }
        break;

      case picking:
        if (task is PickUpTask) {
          view = PickingSessionScreen(
            resumeTask: task,
          );
        }
        break;

      case transfer:
        if (task is TransferTask) {
          view = TransferScreen(
            resumeTask: task,
          );
        }
        break;

      case cycleCount:
        if (task is CycleCountTask) {
          if (task.isVerify()) {
            view = DailyVerifyCycleCountScreen(
              resumeTask: task,
            );
          } else {
            view = DailyCycleCountScreen(
              resumeTask: task,
            );
          }
        }
        break;

      //    case picking:

      // break;
      default:
    }

    // check more view here

    if (view == null) {
      return;
    }

    await Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return view!;
      },
    ));

    _loadTaskStatus();
  }

  bool? _checkAction(BuildContext context, String viewName) {
    final task = _remaining ?? None();

    if (task is None) {
      return true;
    }

    var actionCycleCount = "";
    if (task is CycleCountTask) {
      actionCycleCount =
          task.isVerify() ? verifyCycleCount : cycleCount; // magic number here
    }

    final continueable = ((viewName == receive || viewName == returnProdcut) &&
            task is ReceiveTask) ||
        (viewName == putAway && task is PutAwayTask) ||
        ((viewName == actionCycleCount) && task is CycleCountTask) ||
        (viewName == picking && task is PickUpTask) ||
        (viewName == transfer && task is TransferTask) ||
        (viewName == eqc && task is EqcTask);

    if (continueable) {
      goToRemaining(context, task, viewName);
      return null;
    }

    return false;
  }

  Widget _taskView(
      {required String taskName,
      required String taskCode,
      required void Function() onPressed}) {
    var display = taskCode;
    DateTime? tried = DateTime.tryParse(taskCode);

    if (tried != null) {
      display = StringFormat.shortDate(tried);
    }

    return RoundedContainer(
      backgroundColor: AppColor.colorF6931D,
      innerPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ).copyWith(bottom: 8),
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
                  display,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text("Tiếp Tục"),
          ),
        ],
      ),
    );
  }

  void logout(BuildContext context) async {
    await LoginReference().clearAll();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
      return const LoginScreen();
    }));
  }
}
