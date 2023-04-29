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

  int? productLifeNumber;
  String defaultUnitExpiry = "D";

  AskForDurationScreenViewModel(DurationValue? durationValue) {
    this.durationValue = durationValue ?? DurationValue();

    validateFields = <String, bool>{
      "issueDate": false,
      "expireDate": false,
      //"bestUseD": false,
      //"lotNumber": false,
    };
  }

  void init() {
    if (durationValue.unitExpiry == null) {
      durationValue = durationValue.copyWith();
    }
    validateData();
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
        var unitExpiry = durationValue.unitExpiry;
        unitExpiry ??= defaultUnitExpiry;

        durationValue =
            durationValue.copyWith(numOfExpiry: value, unitExpiry: unitExpiry);
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

    isValid = validateFields.values.every((element) => element);

    if (isValid) {
      validateIfExpiry();
      isValid = !invalidateIfExpiry;
    }
  }

  bool invalidateIfExpiry = false;
  void validateIfExpiry() {
    invalidateIfExpiry = false;

    if (durationValue.unitExpiry != null && durationValue.numOfExpiry != null) {
      final cal = _calculateExpryNumber();
      if (cal == 0) {
        return;
      }

      final days =
          durationValue.expireDate!.difference(durationValue.issueDate!).inDays;

      if (days < cal - 5 || days > cal + 5) {
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

  int _calculateExpryNumber() {
    if (durationValue.issueDate != null && durationValue.expireDate != null) {
      switch (durationValue.unitExpiry) {
        case "D":
          return durationValue.numOfExpiry ?? 0;

        case "M":
          return (durationValue.numOfExpiry ?? 0) * 30;

        case "Y":
          return (durationValue.numOfExpiry ?? 0) * 365;
      }
    }

    return 0;
  }
}
