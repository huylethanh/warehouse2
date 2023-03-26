import 'package:warehouse_app/services/services.dart';

import 'logic_models/logic_models.dart';

class ProcessPutAway {
  final _service = PutAwayService();

  Future<bool> execute(int sessionId, String transportCode, String bin,
      InboundProduct product, int quantity) async {
    final payload = PutAwayRequest(
        processAll: false,
        destLocationCode: bin.toUpperCase(),
        transportCode: transportCode,
        productBarcodeId: product.id,
        serial: product.serial,
        quantity: quantity);

    final result = await _service.process(sessionId, payload);
    return result.data ?? false;
  }
}
