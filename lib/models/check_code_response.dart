import 'package:json_annotation/json_annotation.dart';

part 'check_code_response.g.dart';

@JsonSerializable()
class CheckCodeResponse {
  final int? locationId;
  final String? locationCode;
  final int? locationType;
  final int? physicalType;
  final int? status;
  final int? maxNumberSKU;
  final int? currentNumberSKU;
  final bool? isPickable;

  CheckCodeResponse({
    this.locationId,
    this.locationCode,
    this.locationType,
    this.physicalType,
    this.status,
    this.maxNumberSKU,
    this.currentNumberSKU,
    this.isPickable,
  });

  factory CheckCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckCodeResponseToJson(this);
}
