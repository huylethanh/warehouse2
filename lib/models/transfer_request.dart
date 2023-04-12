import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer_request.g.dart';

@CopyWith()
@JsonSerializable()
class TransferRequest {
  final bool? processAll;
  final String? destLocationCode;
  final String? sourceLocationCode;
  final int? productBarcodeId;
  final String? storageCode;
  final int? quantity;

  TransferRequest({
    this.processAll,
    this.destLocationCode,
    this.sourceLocationCode,
    this.productBarcodeId,
    this.storageCode,
    this.quantity,
  });

  factory TransferRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransferRequestToJson(this);
}
