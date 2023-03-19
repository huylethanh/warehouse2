import 'package:json_annotation/json_annotation.dart';

part 'check_out_transport_request.g.dart';

@JsonSerializable()
class CheckOutTransportRequest {
  final String note;

  CheckOutTransportRequest({this.note = ""});

  factory CheckOutTransportRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckOutTransportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOutTransportRequestToJson(this);
}
