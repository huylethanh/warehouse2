import 'package:warehouse_app/logics/transfer_logic/transfer_logic_base.dart';

class CloseTransportSession extends TransferLogicBase {
  Future<bool> execute(int sessionId) {
    return service.closeSourceLocation(sessionId);
  }
}
