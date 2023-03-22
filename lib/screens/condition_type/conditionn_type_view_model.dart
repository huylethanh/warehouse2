import 'package:flutter/material.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/view_models/view_model_base.dart';

class ChooseConditionScreeViewModel extends ViewModelBase {
  ConditionType? selectedCondion;
  List<ConditionType> conditions;
  ReceiveModel receiveModel;

  ChooseConditionScreeViewModel(
      {required this.conditions, required this.receiveModel}) {
    selectedCondion = conditions[0];
  }

  void goToReceiveSession(BuildContext context) {
    Navigator.pop(context, selectedCondion);
  }

  bool validate() {
    return selectedCondion != null;
  }
}
