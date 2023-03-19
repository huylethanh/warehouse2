import 'package:json_annotation/json_annotation.dart';

part 'ir_code_view.g.dart';

@JsonSerializable()
class IrCodeView {
  final String? irCode;
  final int? qty;

  IrCodeView({
    this.irCode,
    this.qty,
  });

  factory IrCodeView.fromJson(Map<String, dynamic> json) =>
      _$IrCodeViewFromJson(json);

  Map<String, dynamic> toJson() => _$IrCodeViewToJson(this);

  bool equals(dynamic other) {
    if (other == null || other! is IrCodeView) return false;
    return qty == other.qty && irCode == irCode;
  }
}
