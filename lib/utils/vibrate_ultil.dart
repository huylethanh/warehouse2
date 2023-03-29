import 'dart:io';

import 'package:flutter/services.dart';

class VibrateUtil {
  static Future<void> onLongTap() async {
    await HapticFeedback.lightImpact();
    await HapticFeedback.heavyImpact();
  }

  static Future<void> loadDataDone() async {
    await HapticFeedback.lightImpact();
    sleep(
      const Duration(milliseconds: 50),
    );
    await HapticFeedback.lightImpact();
  }

  static Future<void> onSlideVibrate() async {
    await HapticFeedback.lightImpact();
    sleep(
      const Duration(milliseconds: 100),
    );
    await HapticFeedback.lightImpact();
    sleep(
      const Duration(milliseconds: 100),
    );
    await HapticFeedback.lightImpact();
  }
}
