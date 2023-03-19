import 'package:stacked/stacked.dart';
import 'package:warehouse_app/mixins/error_investagator_mixin.dart';

abstract class ViewModelBase extends BaseViewModel with ErrorInvestigator {
  bool isProcessing = false;

  void setProcessing(bool value) {
    isProcessing = value;
    notifyListeners();
  }
}
