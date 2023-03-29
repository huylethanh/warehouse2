import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pick_process_response.g.dart';

@CopyWith()
@JsonSerializable()
class PickProcessResponse {
  final bool isFinished;
  final bool isReload;
  final String? message;

  PickProcessResponse({
    this.isFinished = false,
    this.isReload = false,
    this.message,
  });

  bool isAlternated() {
    return isFinished || isReload;
  }

  factory PickProcessResponse.fromJson(Map<String, dynamic> json) =>
      _$PickProcessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PickProcessResponseToJson(this);
}
