import 'package:json_annotation/json_annotation.dart';

part 'checkIn_transport_request.g.dart';

@JsonSerializable()
class CheckInTransportRequest {
  final int? conditionType;
  final String? transportCode;

  CheckInTransportRequest({this.conditionType, this.transportCode});

  factory CheckInTransportRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckInTransportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInTransportRequestToJson(this);
}
