import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int? milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    cancel();
    _timer = Timer(Duration(milliseconds: milliseconds!), action);
  }

  cancel() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }
}
