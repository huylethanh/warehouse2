import 'package:intl/intl.dart';

class StringFormat {
  static final hmFormat = DateFormat.Hm();
  static final shortFormat = DateFormat.yMd();

  static String hm(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }

    return hmFormat.format(dateTime);
  }

  static String shortDate(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }

    return shortFormat.format(dateTime);
  }
}
