import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/models.dart';

part 'inbound_response.g.dart';

@JsonSerializable()
class InboundResponse {
  final int? irId;
  final int? orId;
  final String? irCode;
  final int? irStatus;
  final int? conditionType;
  final List<ReceiveProduct>? detail;

  InboundResponse({
    this.irId,
    this.orId,
    this.irCode,
    this.irStatus,
    this.conditionType,
    this.detail,
  });

  factory InboundResponse.fromJson(Map<String, dynamic> json) =>
      _$InboundResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InboundResponseToJson(this);
}
