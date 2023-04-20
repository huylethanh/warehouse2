import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'cycle_count_session.g.dart';

@CopyWith()
@JsonSerializable()
class CycleCountSession {
  final int? cycleCountId;
  final int? countingSessionId;
  final String? locationCode;
  final List<CycleCountProduct>? details;

  CycleCountSession({
    this.cycleCountId,
    this.countingSessionId,
    this.locationCode,
    this.details,
  });

  factory CycleCountSession.fromJson(Map<String, dynamic> json) =>
      _$CycleCountSessionFromJson(json);

  Map<String, dynamic> toJson() => _$CycleCountSessionToJson(this);
}
