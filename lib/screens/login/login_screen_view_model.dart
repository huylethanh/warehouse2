// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:warehouse_app/screens/index.dart';
import 'package:warehouse_app/services/user_service.dart';
import 'package:warehouse_app/utils/index.dart';
import 'package:warehouse_app/view_models/view_model_base.dart';

class LoginScreenViewModel extends ViewModelBase {
  final service = UserService();

  bool showedPassword = false;
  String? username = "tnc.tuandao";
  String? password = "123456";

  void showsPassword() {
    showedPassword = !showedPassword;
    notifyListeners();
  }

  void login(BuildContext context) async {
    setBusy(true);
    final login = await service.login(username!, password!);

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

  checkPreviousSessionAndRedirect(BuildContext context) {
    String? loginToken = LoginReference().accessToken;
    if (loginToken != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routing.home, (Route<dynamic> route) => false);
    }
  }
}
