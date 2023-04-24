import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'cycle_count_product.g.dart';

@CopyWith()
@JsonSerializable()
class CycleCountProduct {
  final int? productBarcodeId;
  final String? barcode;
  final ProductType? productType;
  final int actualQty1;
  final String? productName;
  final String? avatarURL;
  final List<RandomCountSerial> storageCodes;
  final DateTime? actualExpiredDate1;
  final String? actualLotNumber1;
  final DateTime? actualManufactureDate1;
  final int actualQty2;
  final DateTime? actualExpiredDate2;
  final DateTime? actualManufactureDate2;
  final int? systemQty1;
  final int? systemQty2;
  final String? systemLotNumber1;
  final String? systemLotNumber2;
  final DateTime? systemExpiredDate1;
  final DateTime? systemExpiredDate2;
  final DateTime? systemManufactureDate1;
  final DateTime? systemManufactureDate2;
  final bool? isLotNumber;
  final bool? isExpiryDate;
  final String? actualLotNumber2;
  final bool hasDifferentQty1;
  final bool hasDifferentQty2;
  String? numOfUnitExpiry;
  final int? difffinalidEXPDays;
  final int? numOfExpiry;
  final String? unitExpiry;

  @JsonKey(name: "partnerSKU")
  final String? partnerSku;

  final int modifiedQty1;
  final int modifiedQty2;
  List<String> additionSerials;

  CycleCountProduct({
    this.productBarcodeId,
    this.barcode,
    this.productType,
    this.actualQty1 = 0,
    this.productName,
    this.avatarURL,
    this.storageCodes = const [],
    this.actualExpiredDate1,
    this.actualLotNumber1,
    this.actualManufactureDate1,
    this.actualQty2 = 0,
    this.actualExpiredDate2,
    this.actualManufactureDate2,
    this.systemQty1,
    this.systemQty2,
    this.systemLotNumber1,
    this.systemLotNumber2,
    this.systemExpiredDate1,
    this.systemExpiredDate2,
    this.systemManufactureDate1,
    this.systemManufactureDate2,
    this.isLotNumber,
    this.isExpiryDate,
    this.actualLotNumber2,
    this.hasDifferentQty1 = false,
    this.hasDifferentQty2 = false,
    this.numOfUnitExpiry,
    this.difffinalidEXPDays,
    this.numOfExpiry,
    this.unitExpiry,
    this.partnerSku,
    this.modifiedQty1 = 0,
    this.modifiedQty2 = 0,
    this.additionSerials = const [],
  });

  void initList() {
    additionSerials = [];
  }

  bool isCounted() {
    return modifiedQty1 > 0 || actualQty1 > 0;
  }

  bool isCountedTwoTimes() {
    return modifiedQty2 > 0 || actualQty2 > 0;
  }

  bool isSerial() {
    return productType!.requireSerial();
  }

  bool isSerialCode(String code) {
    return storageCodes.any((it) => it.storageCode == code);
  }

  void countSerial(String code) {
    additionSerials.add(code);
  }

  factory CycleCountProduct.fromJson(Map<String, dynamic> json) =>
      _$CycleCountProductFromJson(json);

  Map<String, dynamic> toJson() => _$CycleCountProductToJson(this);
}

@CopyWith()
@JsonSerializable()
class RandomCountSerial {
  String? storageCode;
  int? actualQty;
  int? systemQty;

  RandomCountSerial({this.storageCode, this.actualQty, this.systemQty});

  bool isCounted() {
    return actualQty != 0;
  }

  factory RandomCountSerial.fromJson(Map<String, dynamic> json) =>
      _$RandomCountSerialFromJson(json);

  Map<String, dynamic> toJson() => _$RandomCountSerialToJson(this);
}
