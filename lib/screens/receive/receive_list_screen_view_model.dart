// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';

import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/views/views.dart';
import 'package:warehouse_app/services/condition_type_service.dart';
import 'package:warehouse_app/services/services.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'receive_session_screen.dart';

class ReceiveListScreenViewModel extends ViewModelBase {
  final _service = ReceiveService();
  final _conditionService = ConditionTypeService();

  List<ReceiveModel> receives = [];
  List<ReceiveModel> _receivesCache = [];

  final _debouncer = Debouncer(milliseconds: 300);

  void init() {
    fetchData();
  }

  void fetchData() async {
    setBusy(true);

    final result = await _service.checkingSessions();

    if (!result.hasError) {
      _receivesCache.addAll(result.data!);
      receives.addAll(_receivesCache);
      setBusy(false);
      return;
    }
    setBusy(false);
  }

  void showCondition(BuildContext context, ReceiveModel model) async {
    setProcessing(true);

    final result = await _conditionService.getConditionTypes(model.irId!);

    if (!result.hasError) {
      setProcessing(false);

      final seletedCondition =
          await DialogService.showBottomSheet<ConditionType>(
        context,
        canDismiss: false,
        title: "Chọn Tình Trạng Hàng Hóa",
        chid: ConditionTypeScreen(
          model: model,
          conditions: result.data!,
        ),
      );

      if (seletedCondition == null) {
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return ReceiveSessionScreen(
              conditionType: seletedCondition,
              receiveModel: model,
            );
          },
        ),
      );

      return;
    }

    setProcessing(false);
  }

  void search(String? search) {
    _debouncer.run(() {
      receives.clear();
      if (search == null || search.isEmpty) {
        receives.addAll(_receivesCache);
        notifyListeners();
        return;
      }

      final upper = search.toUpperCase();
      final found = _receivesCache
          .where((element) =>
              (element.irCode != null &&
                  element.irCode!.toUpperCase().contains(upper)) ||
              (element.code != null &&
                  element.irCode!.toUpperCase().contains(upper)))
          .toList();

      receives.addAll(found);
      notifyListeners();
    });
  }
}
