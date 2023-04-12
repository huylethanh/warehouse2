import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer_reg_dest_body.g.dart';

@CopyWith()
@JsonSerializable()
class TransferRegDestBody {
  final String? destLocationCode;

  TransferRegDestBody({this.destLocationCode});

  factory TransferRegDestBody.fromJson(Map<String, dynamic> json) =>
      _$TransferRegDestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$TransferRegDestBodyToJson(this);
}
