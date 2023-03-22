import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/models.dart';

part 'put_away_session_response.g.dart';

@CopyWith()
@JsonSerializable()
class PutAwaySessionResponse {
  @JsonKey(name: "putAwaySessionId")
  @JsonKey(name: "eqcSessionId")
  final int? sessionId;

  final List<PutAwaySession>? items;
  final String? partnerName;
  final double? totalWeight;
  final String? objectCode;
  final String? objectType;

  PutAwaySessionResponse({
    this.sessionId,
    this.items,
    this.partnerName,
    this.totalWeight,
    this.objectCode,
    this.objectType,
  });

  factory PutAwaySessionResponse.fromJson(Map<String, dynamic> json) =>
      _$PutAwaySessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PutAwaySessionResponseToJson(this);
}
