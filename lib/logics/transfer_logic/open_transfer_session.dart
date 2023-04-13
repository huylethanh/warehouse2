import 'package:warehouse_app/logics/transfer_logic/transfer_logic_base.dart';

class OpenTransferSession extends TransferLogicBase {
  int sessionId = 0;

  Future<void> execute(String location) async {
    sessionId = await service.openSourceLocation(location);
  }

  close() {
    sessionId = 0;
  }

  resume(int id) {
    sessionId = id;
  }
}
