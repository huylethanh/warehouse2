// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/screens/index.dart';
import 'package:warehouse_app/services/user_service.dart';
import 'package:warehouse_app/widgets/widgets.dart';

class LoginScreenViewModel extends ViewModelBase {
  final service = UserService();

  bool showedPassword = false;
  String? username = 'll.khoa'; // "tnc.tuandao";
  String? password = "123456";

  void showsPassword() {
    showedPassword = !showedPassword;
    notifyListeners();
  }

  void login(BuildContext context) async {
    setBusy(true);
    final login = await service.login(username!, password!);

    if (!login) {
      DialogService.showWarningBotToast("Không đăng nhập thành công.");
    }

    if (login) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (builder) {
          return const HomeScreen();
        }),
      );

      return;
    }

    setBusy(false);
  }

  void updateUsername(String username) {
    this.username = username;
  }

  void updatePassword(String password) {
    this.password = password;
  }
}
