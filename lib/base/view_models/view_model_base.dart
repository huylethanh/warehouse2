// ignore_for_file: use_build_context_synchronously

import 'package:stacked/stacked.dart';

abstract class ViewModelBase extends BaseViewModel {
  bool isProcessing = false;

  void setProcessing(bool value) {
    isProcessing = value;
    notifyListeners();
  }
}
