import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/index.dart';

part 'put_away_session.g.dart';

@CopyWith()
@JsonSerializable()
class PutAwaySession {
  final int? irId;
  final int? productBarcodeId;
  final String? barcode;
  final String? productName;
  final int? qty;
  final int? unitId;
  final String? avatarURL;
  final String? lotNumber;
  final String? expiredDate;
  final bool? isExpiryDate;
  final String? storageTypeName;
  final String? conditionTypeName;
  final List<ProductAttributes>? details;

  PutAwaySession({
    this.irId,
    this.productBarcodeId,
    this.barcode,
    this.productName,
    this.qty,
    this.unitId,
    this.avatarURL,
    this.lotNumber,
    this.expiredDate,
    this.isExpiryDate,
    this.storageTypeName,
    this.conditionTypeName,
    this.details,
  });

  factory PutAwaySession.fromJson(Map<String, dynamic> json) =>
      _$PutAwaySessionFromJson(json);

  Map<String, dynamic> toJson() => _$PutAwaySessionToJson(this);
}
