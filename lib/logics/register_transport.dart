import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/put_away_service.dart';

import 'logic_models/logic_models.dart';

enum OPS { REG_TRANSPORT, REG_BIN, PROCESS, FINISH, RESUMING }

class RegisterTransport {
  final _service = PutAwayService();

  int sessionId = 0;

  String? registeredTransportCode = null;

  String? current() {
    return registeredTransportCode;
  }

  Future<MapEntry<PutAwaySessionResponse, List<InboundProduct>>?> execute(
      String code) async {
    final result = await _service.registerTransport(code);

    if (result.hasError) {
      return null;
    }

    final response = result.data;

    sessionId = response!.sessionId!;
    registeredTransportCode = code;

    return MapEntry(
        response, _transformToListInboundProduct(response.items ?? []));
  }

  void resume(int sessionId, String transportCode) {
    this.sessionId = sessionId;
    registeredTransportCode = transportCode;
  }

  List<InboundProduct> _transformToListInboundProduct(
      List<PutAwaySession> original) {
    final List<InboundProduct> result = [];
    for (final pa in original) {
      if (pa.details == null || pa.details!.isEmpty) {
        result.add(_transformInboundProduct(pa, null));
      } else {
        for (var it in pa.details!) {
          result.add(_transformInboundProduct(pa, it.storageCode));
        }
      }
    }
    return result;
  }

  InboundProduct _transformInboundProduct(
      PutAwaySession session, String? serial) {
    return InboundProduct(
        id: session.productBarcodeId,
        sku: session.barcode,
        name: session.productName,
        quantity: serial == null ? session.qty : 1,
        image: session.avatarURL,
        serial: serial,
        condition: session.storageTypeString());
  }

  clear() {
    registeredTransportCode = null;
  }
}
