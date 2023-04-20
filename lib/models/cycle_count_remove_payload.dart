import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cycle_count_remove_payload.g.dart';

@CopyWith()
@JsonSerializable()
class CycleCountRemovePayload {
  final int? productBarcodeId;
  final List<String> storageCodes;

  CycleCountRemovePayload({
    this.productBarcodeId,
    this.storageCodes = const [],
  });

  factory CycleCountRemovePayload.fromJson(Map<String, dynamic> json) =>
      _$CycleCountRemovePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$CycleCountRemovePayloadToJson(this);
}
