import 'package:jiffy/jiffy.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/utils/string_extension.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/widgets/widgets.dart';

class AskForDurationScreenViewModel extends ViewModelBase {
  late DurationValue durationValue;
  late Map<String, bool> validateFields;

  bool isValid = false;
  double? percentShelfLife;
  Map<String, String> life = {"D": "Ngày", "M": "Tháng", "Y": "Năm"};
  String productLife = "D";
  int? productLifeNumber;

  AskForDurationScreenViewModel(DurationValue? durationValue) {
    this.durationValue = durationValue ?? DurationValue();

    validateFields = <String, bool>{
      "issueDate": false,
      "expireDate": false,
      //"bestUseD": false,
      "lotNumber": false,
    };
  }

  String getLifeDisplay(String value) {
    return life[value]!;
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

      // case "bestUseD":
      //   durationValue = durationValue.copyWith(bestUseD: value);
      //   break;

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

  void onLifeSelected(String value) {
    productLife = value;
    _calculateExpireDate();
  }

  void onProductLifeNumberChanges(int value) {
    productLifeNumber = value;
    _calculateExpireDate();
    //notifyListeners();
  }

  void _calculateExpireDate() {
    if (durationValue.issueDate != null && productLifeNumber != null) {
      switch (productLife) {
        case "D":
          updateDuration(
              "expireDate",
              Jiffy.parseFromDateTime(durationValue.issueDate!)
                  .add(days: productLifeNumber!)
                  .dateTime);
          break;

        case "M":
          updateDuration(
              "expireDate",
              Jiffy.parseFromDateTime(durationValue.issueDate!)
                  .add(months: productLifeNumber!)
                  .dateTime);
          break;

        case "Y":
          updateDuration(
              "expireDate",
              Jiffy.parseFromDateTime(durationValue.issueDate!)
                  .add(years: productLifeNumber!)
                  .dateTime);
          break;
      }
    }
  }
}
