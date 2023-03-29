import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pick_process_payload.g.dart';

@CopyWith()
@JsonSerializable()
class PickProcessPayload {
  final int? pickListId;
  final int? pickSessionId;
  final int? binLocationId;
  final int? pickUpLocationId;
  final int? qty;
  final String? storageCode;
  final bool? isRepick;

  PickProcessPayload({
    this.pickListId,
    this.pickSessionId,
    this.binLocationId,
    this.pickUpLocationId,
    this.qty,
    this.storageCode,
    this.isRepick = false,
  });

  factory PickProcessPayload.fromJson(Map<String, dynamic> json) =>
      _$PickProcessPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PickProcessPayloadToJson(this);
}
