import 'package:stacked/stacked.dart';

import '../../mixins/error_investagator_mixin.dart';

abstract class ViewModelBase extends BaseViewModel with ErrorInvestigator {
  bool isProcessing = false;

  void setProcessing(bool value) {
    isProcessing = value;
    notifyListeners();
  }
}
