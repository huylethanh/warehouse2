import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_demension_response.g.dart';

@CopyWith()
@JsonSerializable()
class CheckDimensionResponse {
  final bool? hasPhysicalData;
  final double? actualWeight;
  final double? length;
  final double? width;
  final double? height;

  CheckDimensionResponse({
    this.hasPhysicalData,
    this.actualWeight,
    this.length,
    this.width,
    this.height,
  });

  factory CheckDimensionResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckDimensionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckDimensionResponseToJson(this);
}
