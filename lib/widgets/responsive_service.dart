import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:warehouse_app/utils/constants.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'containers/rounded_container.dart';

class DialogService {
  static Future<T?> showBottomSheet<T>(
    BuildContext context, {
    required Widget chid,
    required String title,
    bool canDismiss = true,
  }) {
    return showModalBottomSheet(
      isDismissible: canDismiss,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext context) {
        return SafeArea(
          child: LimitedBox(
            maxWidth: MediaQuery.of(context).size.width / 2,
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(16).copyWith(
                    top: 2,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(child: SizedBox()),
                          Column(
                            children: [
                              RoundedContainer(
                                  margin: const EdgeInsets.only(top: 2),
                                  innerPadding: EdgeInsets.zero,
                                  backgroundColor:
                                      AppColor.colorB4B4B3.withOpacity(0.5),
                                  child: const SizedBox(
                                    height: 4,
                                    width: 100,
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  title,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SplashButtonWidget(
                                margin: const EdgeInsets.only(top: 8.0),
                                width: 25,
                                height: 25,
                                color: AppColor.color636366,
                                borderRadius: const Radius.circular(50),
                                child: const Icon(
                                  FontAwesomeIcons.xmark,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      chid,
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }

  static Future<bool> confirmDialog(BuildContext context,
      {String? title,
      String? message,
      String? template,
      String entityName = '',
      String? yesLabel,
      bool oneOption = false,
      String? noLabel}) async {
    final confirm = await showDialog<bool>(
        context: context,
        builder: (context) {
          final actions = [
            TextButton(
              child: Text(
                noLabel ?? 'No',
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            if (!oneOption)
              TextButton(
                child: Text(
                  yesLabel ?? 'Yes',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    //  color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
          ];

          return Platform.isIOS
              ? CupertinoAlertDialog(
                  title: Text(title ?? ''),
                  content: Text(message ?? ''),
                  actions: actions,
                )
              : AlertDialog(
                  title: Text(title ?? ''),
                  content: Text(message ?? ''),
                  actions: actions,
                );
        });

    return confirm ?? false;
  }

  static showSuccessBotToast(String text, {Duration? duration}) {
    showBotToast(
      text,
      Colors.green,
      duration: duration,
    );
  }

  static showErrorBotToast(String text, {Duration? duration}) {
    showBotToast(
      text,
      Colors.red,
      duration: duration,
    );
  }

  static showWarningBotToast(String text, {Duration? duration}) {
    showBotToast(
      text,
      Colors.orange,
      duration: duration,
    );
  }

  static showBotToast(String text, Color color, {Duration? duration}) {
    BotToast.showText(
      text: text,
      contentColor: color,
      align: Alignment.topCenter,
      duration: duration ?? const Duration(milliseconds: 2500),
    );
  }
}
