import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cycle_count_session_response.g.dart';

@CopyWith()
@JsonSerializable()
class CycleCountSessionResponse {
  int? cycleCountId;
  String? cycleCountCode;
  int? countingSessionId;

  CycleCountSessionResponse({
    this.cycleCountId,
    this.cycleCountCode,
    this.countingSessionId,
  });

  factory CycleCountSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$CycleCountSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CycleCountSessionResponseToJson(this);
}
