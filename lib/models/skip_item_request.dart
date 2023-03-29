import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skip_item_request.g.dart';

@CopyWith()
@JsonSerializable()
class SkipItemRequest {
  final int? pickSessionId;
  final int? binLocationId;
  final int? productBarcodeId;
  final int? unitId;
  final String? storageCode;
  final bool? isRepick;

  SkipItemRequest({
    this.pickSessionId,
    this.binLocationId,
    this.productBarcodeId,
    this.unitId,
    this.storageCode,
    this.isRepick,
  });

  factory SkipItemRequest.fromJson(Map<String, dynamic> json) =>
      _$SkipItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SkipItemRequestToJson(this);
}
