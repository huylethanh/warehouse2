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
      //"lotNumber": false,
    };
  }

  String getLifeDisplay(String value) {
    return life[value]!;
  }

  void updateDuration(String fieldName, dynamic value) {
    if (["expireDate", "issueDate"].contains(fieldName)) {
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

      case "numOfExpiry":
        durationValue = durationValue.copyWith(numOfExpiry: value);
        break;

      case "unitExpiry":
        durationValue = durationValue.copyWith(unitExpiry: value);
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

    if (isValid) {
      validateIfExpiry();
    }
  }

  bool invalidateIfExpiry = true;
  void validateIfExpiry() {
    invalidateIfExpiry = false;

    if (durationValue.unitExpiry != null && durationValue.numOfExpiry != null) {
      final days =
          durationValue.expireDate!.difference(durationValue.issueDate!).inDays;

      if (days < durationValue.numOfExpiry! - 5 ||
          days > durationValue.numOfExpiry! - 5) {
        invalidateIfExpiry = true;
      }
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
