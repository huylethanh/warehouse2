import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'finish_picking_payload.g.dart';

@CopyWith()
@JsonSerializable()
class FinishPickingPayload {
  final int? pickListId;

  FinishPickingPayload({
    this.pickListId,
  });

  factory FinishPickingPayload.fromJson(Map<String, dynamic> json) =>
      _$FinishPickingPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$FinishPickingPayloadToJson(this);
}
