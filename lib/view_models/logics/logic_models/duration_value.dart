import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'duration_value.g.dart';

@CopyWith()
@JsonSerializable()
class DurationValue {
  final DateTime? issueDate;
  final DateTime? expireDate;
  final DateTime? bestUseD;
  final String? lotNumber;

  DurationValue({
    this.issueDate,
    this.expireDate,
    this.bestUseD,
    this.lotNumber,
  });

  factory DurationValue.fromJson(Map<String, dynamic> json) =>
      _$DurationValueFromJson(json);

  Map<String, dynamic> toJson() => _$DurationValueToJson(this);
}
