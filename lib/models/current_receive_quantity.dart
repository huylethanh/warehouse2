import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_receive_quantity.g.dart';

@CopyWith()
@JsonSerializable()
class CurrentReceiveQuantity {
  final int? irId;
  final int? expectQty;
  final int? actualQty;
  final int? exceptionQty;

  CurrentReceiveQuantity({
    this.irId,
    this.expectQty,
    this.actualQty,
    this.exceptionQty,
  });

  factory CurrentReceiveQuantity.fromJson(Map<String, dynamic> json) =>
      _$CurrentReceiveQuantityFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentReceiveQuantityToJson(this);
}
