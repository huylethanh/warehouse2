import 'package:json_annotation/json_annotation.dart';

part 'put_away_request.g.dart';

@JsonSerializable()
class PutAwayRequest {
  final bool? processAll;
  // bin
  final String? destLocationCode;
  final String? transportCode;
  final int? productBarcodeId;
  final String? serial;
  final int? quantity;

  PutAwayRequest({
    this.processAll,
    this.destLocationCode,
    this.transportCode,
    this.productBarcodeId,
    this.serial,
    this.quantity,
  });

  factory PutAwayRequest.fromJson(Map<String, dynamic> json) =>
      _$PutAwayRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PutAwayRequestToJson(this);
}
