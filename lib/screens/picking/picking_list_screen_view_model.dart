import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/picking/picking.dart';
import 'package:warehouse_app/utils/utils.dart';

class PickingListScreenViewModel extends ViewModelBase {
  final _getORList = GetORList();
  final List<ORViewItem> sessionList = [];
  final List<ORViewItem> _sessionListCache = [];
  final _debouncer = Debouncer(milliseconds: 300);

  init() {
    fetchData();
  }

  void fetchData() async {
    setBusy(true);

    _sessionListCache.clear();
    sessionList.clear();
    final list = await _getORList.execute();
    _sessionListCache.addAll(list);
    sessionList.addAll(list);

    setBusy(false);
  }

  void search(String search) {
    _debouncer.run(
      () {
        sessionList.clear();
        if (search == null || search.isEmpty) {
          sessionList.addAll(_sessionListCache);
          notifyListeners();
          return;
        }

        final upper = search.toUpperCase();
        final found = _sessionListCache
            .where((element) => (element.code != null &&
                element.code!.toUpperCase().contains(upper)))
            .toList();

        sessionList.addAll(found);
        notifyListeners();
      },
    );
  }

  void startPicking(BuildContext context, ORPicking picking) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return PickingSessionScreen(orPicking: picking);
        },
      ),
    );
  }

  String checkDate(String dateTime) {
    final timestamp = DateTime.tryParse(dateTime);
    if (timestamp == null) {
      return "Không có dữ liệu";
    }

    final dateTimeCreatePick = timestamp.millisecond;
    final currentDateTime = DateTime.now().millisecond;

    final millis = DateTime.fromMillisecondsSinceEpoch(
        currentDateTime - dateTimeCreatePick);

    final seconds = millis.second;
    final minutes = millis.minute;
    final hours = millis.hour;
    final days = millis.day;

    if (seconds > 1 && seconds < 59) {
      return "$seconds giây";
    } else if (minutes > 1 && minutes < 59 && hours < 1) {
      return "$minutes phút";
    } else if (hours >= 1 && days < 1) {
      return "$hours giờ ${minutes % 60} phút";
    } else if (days >= 1) {
      return "$days ngày ${hours % 24} giờ";
    } else {
      return "0 giây";
    }
  }

  String setupPriority(int priority) {
    switch (priority) {
      case 1:
        return "Thấp";

      case 2:
        return "Trung bình";

      case 3:
        return "Cao";

      default:
        return "";
    }
  }
}
