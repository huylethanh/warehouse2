class InboundProduct {
  final int? id;
  final String? sku;
  final String? name;
  final int? quantity;
  final String? image;
  final String? serial;
  final String? condition;
  final int? unitId;
  final String? lotNo;
  final String? expireDate;
  final bool? isExpiryDate;

  InboundProduct({
    this.id,
    this.sku,
    this.name,
    this.quantity,
    this.image,
    this.serial,
    this.condition,
    this.unitId,
    this.lotNo,
    this.expireDate,
    this.isExpiryDate,
  });

  bool hasSerial() {
    return serial != null;
  }

  int out = 0;

  @override
  String toString() {
    return "$name\n$sku - $serial";
  }
}
