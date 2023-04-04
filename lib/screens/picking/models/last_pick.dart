import 'package:warehouse_app/models/models.dart';

import 'models.dart';

class LastPicked {
  int? total;
  int? need;
  String? bin;
  PickingTransport? transport;
  PickingProduct? product;

  LastPicked({this.total, this.need, this.bin, this.transport, this.product});
}
