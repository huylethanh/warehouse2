import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repick_request.g.dart';

@CopyWith()
@JsonSerializable()
class RepickRequest {
  final String? locationCode;

  RepickRequest({
    this.locationCode,
  });

  factory RepickRequest.fromJson(Map<String, dynamic> json) =>
      _$RepickRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RepickRequestToJson(this);
}
