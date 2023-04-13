import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_put_away_session.g.dart';

@JsonSerializable()
@CopyWith()
class CreatePutAwaySessionRequest {
  final String? locationCode;

  CreatePutAwaySessionRequest({this.locationCode});

  factory CreatePutAwaySessionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePutAwaySessionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePutAwaySessionRequestToJson(this);
}
