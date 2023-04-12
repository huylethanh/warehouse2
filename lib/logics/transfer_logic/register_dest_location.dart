import 'package:warehouse_app/logics/transfer_logic/transfer_logic_base.dart';

class RegisterDestLocation extends TransferLogicBase {
  execute(int sessionId, String location) async {
    await service.regDestLocation(sessionId, location);
  }
}
