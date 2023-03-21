import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_app/utils/constants.dart';
import 'package:warehouse_app/widgets/index.dart';

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
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    children: [
                      RoundedContainer(
                          margin: const EdgeInsets.only(top: 8),
                          innerPadding: EdgeInsets.zero,
                          backgroundColor: AppColor.gray400.withOpacity(0.5),
                          child: const SizedBox(
                            height: 5,
                            width: 200,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          title,
                          style: const TextStyle(fontSize: 18),
                        ),
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

  static showSuccessBotToast(String text) {
    showBotToast(text, Colors.green);
  }

  static showErrorBotToast(String text) {
    showBotToast(text, Colors.red);
  }

  static showWarningBotToast(String text) {
    showBotToast(text, Colors.orange);
  }

  static showBotToast(String text, Color color) {
    BotToast.showText(
      text: text,
      contentColor: color,
      align: Alignment.topCenter,
    );
  }
}
