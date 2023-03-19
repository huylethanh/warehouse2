import 'package:flutter/material.dart';

import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/screens/condition_type1/conditon_type_screen.dart';
import 'package:warehouse_app/services/condition_type_service.dart';
import 'package:warehouse_app/services/index.dart';
import 'package:warehouse_app/view_models/view_model_base.dart';
import 'package:warehouse_app/widgets/index.dart';

class ReceiveScreenViewModel extends ViewModelBase {
  final _service = ReceiveService();
  final _conditionService = ConditionTypeService();

  List<ReceiveModel> receives = [];
  List<ReceiveModel> _receivesCache = [];
  void init() {
    _loadReceives();
  }

  void _loadReceives() async {
    setBusy(true);

    final result = await _service.checkingSessions();

    if (!result.hasError) {
      _receivesCache.addAll(result.data!);
      receives.addAll(_receivesCache);
      setBusy(false);
      return;
    }

    investigateError(result.errorMessage, () => setBusy(false));
  }

  void showCondition(BuildContext context, ReceiveModel model) async {
    setProcessing(true);

    final result = await _conditionService.getConditionTypes(model.irId!);

    if (!result.hasError) {
      // ignore: use_build_context_synchronously
      DialogService.showBottomSheet(context,
          canDismiss: false,
          title: "Choose condition type",
          chid: ConditionTypeScreen(model: model, conditions: result.data!));
      setProcessing(false);
      return;
    }

    investigateError(result.errorMessage, () => setProcessing(false));
  }

  void search(String? search) {
    receives.clear();
    if (search == null || search.isEmpty) {
      receives.addAll(_receivesCache);
      notifyListeners();
      return;
    }

    final upper = search.toUpperCase();
    final found = _receivesCache
        .where((element) =>
            element.irCode != null &&
            element.irCode!.toUpperCase().contains(upper))
        .toList();

    receives.addAll(found);
    notifyListeners();
  }
}
