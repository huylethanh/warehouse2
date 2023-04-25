import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/models/models.dart';

class LotDateViewModel extends ViewModelBase {
  late CycleCountProduct product;
  late DateTime issuDate;
  late DateTime expiredDate;
  late String? lotNumber;
  bool needDate = false;
  bool needLotNumber = false;

  String productLife = "D";
  int? productLifeNumber;

  Map<String, String> life = {"D": "Ngày", "M": "Tháng", "Y": "Năm"};

  LotDateViewModel(this.product) {
    expiredDate = product.systemExpiredDate1 ?? DateTime.now();
    issuDate = product.systemManufactureDate1 ?? DateTime.now();
    lotNumber = product.systemLotNumber1;

    needDate = product.isExpiryDate ?? false;
    needLotNumber = product.isLotNumber ?? false;
  }

  void onIssuDateChanges(DateTime date) {
    issuDate = date;
    notifyListeners();
  }

  void onExpiredDateChanges(DateTime date) {
    expiredDate = date;
    notifyListeners();
  }

  String getLifeDisplay(String value) {
    return life[value]!;
  }

  void onLifeSelected(String value) {
    productLife = value;
    notifyListeners();
  }

  void onProductLifeNumberChanges(int value) {
    productLifeNumber = value;
    //notifyListeners();
  }

  void onLotNumberChanges(String value) {
    lotNumber = value;
    //notifyListeners();
  }
}
