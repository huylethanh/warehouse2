// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/utils/index.dart';

import 'login_screen_view_model.dart';

class LoginScreen extends StatefulWidget {
  final String? loginReason;

  const LoginScreen({super.key, this.loginReason});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    checkPreviousSessionAndRedirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(
      height: 20,
    );
    return ViewModelBuilder.reactive(viewModelBuilder: () {
      return LoginScreenViewModel();
    }, builder: (BuildContext context, LoginScreenViewModel viewModel, _) {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warehouse,
                  size: 120,
                  color: AppColor.orange700,
                ),
                if (!widget.loginReason.isNullOrEmptyEx())
                  Text(widget.loginReason!),
                gap,
                TextField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.secondary400)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.secondary600)),
                    floatingLabelStyle: TextStyle(color: Colors.grey),
                    labelText: 'Tài Khoản',
                    hintText: "Nhập tài khoản",
                    isDense: true,
                  ),
                  onChanged: (value) {
                    viewModel.updateUsername(value);
                  },
                ),
                gap,
                TextField(
                  obscureText: !viewModel.showedPassword,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.secondary400)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.secondary600)),
                    floatingLabelStyle: TextStyle(color: Colors.grey),
                    labelText: 'Mật Khẩu',
                    hintText: "Nhập mật khẩu",
                    suffixIcon: IconButton(
                      onPressed: () {
                        viewModel.showsPassword();
                      },
                      icon: Icon(
                        Icons.remove_red_eye_sharp,
                        color: viewModel.showedPassword
                            ? AppColor.secondary500
                            : Colors.grey,
                        size: 20,
                      ),
                    ),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    viewModel.updatePassword(value);
                  },
                ),
                gap,
                ElevatedButton(
                  onPressed: viewModel.isBusy
                      ? null
                      : () {
                          viewModel.login(context);
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.orange700,
                      minimumSize: const Size.fromHeight(50)),
                  child: Text(
                    viewModel.isBusy ? "Đăng Nhập ..." : "Đăng Nhập",
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void checkPreviousSessionAndRedirect() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      String? loginToken = LoginReference().accessToken;
      if (loginToken != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routing.home, (Route<dynamic> route) => false);
      }
    });
  }
}
