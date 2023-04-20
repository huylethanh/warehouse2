import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cycle_count_session_request.g.dart';

@CopyWith()
@JsonSerializable()
class CycleCountSessionRequest {
  int cycleCountId;
  String locationCode;
  int cycleCountType;
  int roundNumber;

  CycleCountSessionRequest({
    required this.cycleCountId,
    required this.locationCode,
    required this.cycleCountType,
    required this.roundNumber,
  });

  factory CycleCountSessionRequest.fromJson(Map<String, dynamic> json) =>
      _$CycleCountSessionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CycleCountSessionRequestToJson(this);
}
