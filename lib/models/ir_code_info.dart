import 'package:json_annotation/json_annotation.dart';

import 'ir_code_view.dart';

part 'ir_code_info.g.dart';

@JsonSerializable()
class IrCodeInfo {
  final int? irId;
  final String? irCode;
  final String? receivedDate;
  final int? qty;

  IrCodeInfo({
    this.irId,
    this.irCode,
    this.receivedDate,
    this.qty,
  });

  factory IrCodeInfo.fromJson(Map<String, dynamic> json) =>
      _$IrCodeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IrCodeInfoToJson(this);

  IrCodeView toView() {
    return IrCodeView(irCode: irCode, qty: qty);
  }
}
