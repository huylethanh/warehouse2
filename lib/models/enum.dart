import 'package:json_annotation/json_annotation.dart';

enum ProductType {
  @JsonValue(1)
  serial(1),

  @JsonValue(2)
  nonSerial(2),

  @JsonValue(3)
  cargo(3);

  final int value;

  const ProductType(this.value);
}

extension ProductTypeExtension on ProductType {
  bool requireSerial() {
    return this != ProductType.nonSerial;
  }
}
