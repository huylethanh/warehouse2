import 'package:warehouse_app/logics/transfer_logic/transfer_logic_base.dart';

import '../../models/models.dart';

class TransferBINToBIN extends TransferLogicBase {
  Future<bool> execute(int sessionId, String src, String dest,
      TransferProduct product, int quantity) async {
    return service.transferBINToBIN(
        sessionId, src.toUpperCase(), dest.toUpperCase(), product, quantity);
  }
}
