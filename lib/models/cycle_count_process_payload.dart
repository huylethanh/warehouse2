import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cycle_count_process_payload.g.dart';

@CopyWith()
@JsonSerializable()
class CycleCountProcessPayload {
  final int? productBarcodeId;
  final String? storageCode;
  final int qty;
  final String? lotNumber;
  final int? expiredDate;
  final int? manufactureDate;
  final int? numOfExpiry;
  final String? unitExpiry;

  CycleCountProcessPayload({
    this.productBarcodeId,
    this.storageCode,
    this.qty = 0,
    this.lotNumber,
    this.expiredDate,
    this.manufactureDate,
    this.numOfExpiry,
    this.unitExpiry,
  });

  factory CycleCountProcessPayload.fromJson(Map<String, dynamic> json) =>
      _$CycleCountProcessPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$CycleCountProcessPayloadToJson(this);
}
