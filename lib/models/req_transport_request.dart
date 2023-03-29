import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'req_transport_request.g.dart';

@CopyWith()
@JsonSerializable()
class RegTransportRequest {
  final List<String>? locationCodes;

  RegTransportRequest({this.locationCodes});

  factory RegTransportRequest.fromJson(Map<String, dynamic> json) =>
      _$RegTransportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegTransportRequestToJson(this);
}
