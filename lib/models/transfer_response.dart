import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer_response.g.dart';

@CopyWith()
@JsonSerializable()
class TransferResponse {
  final int? id;

  TransferResponse({this.id});

  factory TransferResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransferResponseToJson(this);
}
