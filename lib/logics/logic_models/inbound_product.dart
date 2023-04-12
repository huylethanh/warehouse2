class InboundProduct {
  final int? id;
  final int? productId;
  final String? productSize;
  final String? sku;
  final String? name;
  final int? quantity;
  final String? image;
  final String? serial;
  final String? condition;
  final int unitId;
  final String? lotNo;
  final String? expireDate;
  final String? manufactureDate;
  final bool? isExpiryDate;
  final bool? isLotNumber;
  final String? numOfUnitExpiry;
  final int? difffinalidEXPDays;

  //@SerializedName("partnerSKU")
  final String? partnerSku;
  final String? partnerName;
  final int? conditionTypeId;
  final int? productBrandId;
  final String? productBrandName;

  InboundProduct(
      {this.id,
      this.sku,
      this.name,
      this.quantity,
      this.image,
      this.serial,
      this.condition,
      this.unitId = 0,
      this.lotNo,
      this.expireDate,
      this.isExpiryDate,
      this.conditionTypeId,
      this.difffinalidEXPDays,
      this.isLotNumber,
      this.manufactureDate,
      this.numOfUnitExpiry,
      this.partnerName,
      this.partnerSku,
      this.productBrandId,
      this.productBrandName,
      this.productId,
      this.productSize});

  bool hasSerial() {
    return serial != null;
  }

  int out = 0;

  @override
  String toString() {
    return "$name\n$sku - $serial";
  }
}
