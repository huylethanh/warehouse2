import 'models.dart';

class LastPicked {
  final int? total;
  final int? need;
  final String? bin;
  final PickingTransport? transport;
  final PickingProduct? product;

  LastPicked({this.total, this.need, this.bin, this.transport, this.product});
}
