import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:warehouse_app/base/view_models/index.dart';

import '../put_away/put_away_screen.dart';
import '../receive/index.dart';

class HomeScreenViewModel extends ViewModelBase {
  static const String receive = "receive";
  static const String putAway = "putAway";
  static const String pickUp = "pickUp";
  static const String transfer = "transfer";
  static const String audit = "audit";
  static const String handOver = "handOver";

  int selectedIndex = 0;

  final List views = [];

  void init() {
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
        "name": pickUp,
        "icon": FontAwesomeIcons.truckFast,
        "color": Colors.indigoAccent
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
        "name": audit,
        "icon": FontAwesomeIcons.checkToSlot,
        "color": Colors.blueGrey
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
    late Widget page;
    switch (name) {
      case receive:
        page = ReceiveListScreen();
        break;

      case putAway:
        page = PutAwayScreen();
        break;

      default:
        page = PutAwayScreen();
        break;
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

  String getName(String name) {
    switch (name) {
      case receive:
        return "Nhận Hàng";

      case putAway:
        return "Lưu Kho";

      case pickUp:
        return "Lấy Hàng";

      case transfer:
        return "Luân Chuyển";

      case audit:
        return "Kiểm Kê";

      case handOver:
        return "Bàn Giao";

      default:
        throw Exception("Not support the name: $name");
    }
  }
}
