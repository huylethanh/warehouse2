// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:warehouse_app/screens/index.dart';
import 'package:warehouse_app/services/user_service.dart';
import 'package:warehouse_app/view_models/view_model_base.dart';

class LoginScreenViewModel extends ViewModelBase {
  final service = UserService();

  bool showedPassword = false;
  String? username;
  String? password;

  void showsPassword() {
    showedPassword = !showedPassword;
    notifyListeners();
  }

  void login(BuildContext context) async {
    setBusy(true);
    // final login = await service.login(username!, password!);

    // if (login) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (builder) {
    //       return const HomeScreen();
    //     }),
    //   );

    //   return;
    // }

    await Future.delayed(Duration(milliseconds: 1000));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (builder) {
        return const HomeScreen();
      }),
    );

    setBusy(false);
  }

  void updateUsername(String username) {
    this.username = username;
  }

  void updatePassword(String password) {
    this.password = password;
  }
}
