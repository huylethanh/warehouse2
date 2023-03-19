import 'dart:math';

import 'package:warehouse_app/utils/string_extension.dart';
import 'package:warehouse_app/view_models/models/index.dart';
import 'package:warehouse_app/view_models/view_model_base.dart';
import 'package:warehouse_app/widgets/index.dart';

class AskForDurationViewModel extends ViewModelBase {
  late DurationValue durationValue;
  late Map<String, bool> validateFields;

  bool isValid = false;
  double? percentShelfLife;

  AskForDurationViewModel(DurationValue? durationValue) {
    this.durationValue = durationValue ?? DurationValue();

    validateFields = <String, bool>{
      "issueDate": false,
      "expireDate": false,
      "bestUseD": false,
      "lotNumber": false,
    };
  }

  void updateDuration(String fieldName, dynamic value) {
    if (fieldName != "lotNumber") {
      final validate = _validateSelectedDate(fieldName, value);
      if (!validate) {
        return;
      }
    }

    switch (fieldName) {
      case "issueDate":
        durationValue = durationValue.copyWith(issueDate: value);
        break;

      case "expireDate":
        durationValue = durationValue.copyWith(expireDate: value);
        break;

      case "bestUseD":
        durationValue = durationValue.copyWith(bestUseD: value);
        break;

      case "lotNumber":
        durationValue = durationValue.copyWith(lotNumber: value);
        break;
    }

    validateData();
    _computeShelfLife(durationValue.issueDate, durationValue.expireDate);
    notifyListeners();
  }

  bool _validateSelectedDate(String fieldName, DateTime? value) {
    if (value == null) {
      DialogService.showWarningBotToast("Chưa chọn ngày.");
      return false;
    }

    switch (fieldName) {
      case "issueDate":
        if (durationValue.expireDate != null &&
            durationValue.expireDate!.difference(value).inDays <= 0) {
          DialogService.showWarningBotToast(
              "Ngày sản xuất phải trước ngày hết hạn.");
          return false;
        }
        break;

      case "expireDate":
        break;

      case "bestUseD":
        if (value.difference(durationValue.expireDate!).inDays > 0) {
          DialogService.showWarningBotToast(
              "Ngày sữ dụng tốt nhất phải nằm trong ngày sản xuất và ngày hết hạn.");
          return false;
        }

        if (value.difference(durationValue.issueDate!).inDays < 0) {
          DialogService.showWarningBotToast(
              "Ngày sữ dụng tốt nhất phải nằm trong ngày sản xuất và ngày hết hạn.");
          return false;
        }

        break;
    }

    return true;
  }

  bool validateBeforeInputDate(String fieldName) {
    switch (fieldName) {
      case "issueDate":
        break;

      case "expireDate":
        // durationValue = durationValue.copyWith(expireDate: value);
        break;

      case "bestUseD":
        if (durationValue.expireDate == null) {
          DialogService.showWarningBotToast("Chưa chọn ngày hết hạn.");
          return false;
        }

        if (durationValue.issueDate == null) {
          DialogService.showWarningBotToast("Chưa chọn ngày sản xuất.");
          return false;
        }
        break;
    }

    return true;
  }

  void validateData() {
    final json = durationValue.toJson();

    for (var field in validateFields.keys) {
      if (field == "lotNumber") {
        validateFields[field] = !isNullOrEmpty(json[field]);
        continue;
      }

      validateFields[field] = json[field] != null;
    }

    if (validateFields.values.every((element) => element)) {
      isValid = true;
    }
  }

  void _computeShelfLife(DateTime? issueDate, DateTime? expireDate) {
    if (issueDate == null || expireDate == null) {
      return;
    }

    final now = DateTime.now();

    final high = expireDate.millisecond - now.millisecond;
    final low = expireDate.millisecond - issueDate.millisecond;

    percentShelfLife = (high / low) * 100;
  }
}
