import 'package:warehouse_app/logics/transfer_logic/transfer_logic_base.dart';

class TransferAllBINToBIN extends TransferLogicBase {
  Future<void> execute(int sessionId, String src, String dest) async {
    service.transferAllBINToBIN(
        sessionId, src.toUpperCase(), dest.toUpperCase());
  }
}
