import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_duration.g.dart';

@JsonSerializable()
@CopyWith()
class ProductDuration {
  final DateTime? expireD;
  final DateTime? issueD;
  final DateTime? bestUseD;
  double? manDate;
  double? exp;
  double? bestBefore;

  ProductDuration({
    this.expireD,
    this.issueD,
    this.bestUseD,
    this.manDate,
    this.exp,
    this.bestBefore,
  });

  factory ProductDuration.fromJson(Map<String, dynamic> json) =>
      _$ProductDurationFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDurationToJson(this);

  void calculate() {
    manDate = (issueD?.millisecondsSinceEpoch ?? 0) / 1000;
    exp = (expireD?.millisecondsSinceEpoch ?? 0) / 1000;
    bestBefore = (bestUseD?.millisecondsSinceEpoch ?? 0) / 1000;
  }
}
