import 'package:flutter/material.dart';
import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/screens/index.dart';
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
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ReceiveSessionScreen(
            conditionType: selectedCondion!,
            receiveModel: receiveModel,
          );
        },
      ),
    );
  }

  bool validate() {
    return selectedCondion != null;
  }
}
