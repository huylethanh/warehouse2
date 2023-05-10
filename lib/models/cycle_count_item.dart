import 'package:warehouse_app/models/models.dart';

class CycleCountItem {
  int? id;
  String? image;
  String? name;
  String? barcode;
  int quantity1;
  int quantity2;
  bool isExpiryDate;
  bool isLotNumber;
  int systemQty1;
  int systemQty2;
  String? systemLotNumber1;
  String? systemLotNumber2;
  DateTime? systemExpiredDate1;
  DateTime? systemExpiredDate2;
  DateTime? systemManufactureDate1;
  DateTime? systemManufactureDate2;
  String? actualLotNumber2;
  String? actualLotNumber1;
  DateTime? actualExpiredDate1;
  DateTime? actualExpiredDate2;
  DateTime? actualManufactureDate1;
  DateTime? actualManufactureDate2;
  bool hasDifferentQty1;
  bool hasDifferentQty2;
  bool isSerial;
  int? dataIndex;
  final CycleCountProduct product;

  CycleCountItem({
    this.id,
    this.image,
    this.name,
    this.barcode,
    this.quantity1 = 0,
    this.quantity2 = 0,
    this.isExpiryDate = false,
    this.isLotNumber = false,
    this.systemQty1 = 0,
    this.systemQty2 = 0,
    this.systemLotNumber1,
    this.systemLotNumber2,
    this.systemExpiredDate1,
    this.systemExpiredDate2,
    this.systemManufactureDate1,
    this.systemManufactureDate2,
    this.actualLotNumber2,
    this.actualLotNumber1,
    this.actualExpiredDate1,
    this.actualExpiredDate2,
    this.actualManufactureDate1,
    this.actualManufactureDate2,
    this.hasDifferentQty1 = false,
    this.hasDifferentQty2 = false,
    this.isSerial = false,
    this.dataIndex,
    required this.product,
  });

  bool areItemsTheSame(CycleCountItem oldItem, CycleCountItem newItem) {
    return oldItem.id == newItem.id;
  }

  bool areContentsTheSame(CycleCountItem oldItem, CycleCountItem newItem) {
    return oldItem == newItem;
  }
}
