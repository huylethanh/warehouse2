import 'package:json_annotation/json_annotation.dart';

part 'receive_model.g.dart';

@JsonSerializable()
class ReceiveModel {
  final int? irId;
  final String? code;
  final String? partnerCode;
  final String? shortName;
  final DateTime? createdDate;
  final String? irCode;
  final int? warehouseId;

  ReceiveModel(
      {this.irId,
      this.code,
      this.partnerCode,
      this.shortName,
      this.createdDate,
      this.irCode,
      this.warehouseId});

  factory ReceiveModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiveModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveModelToJson(this);
}
