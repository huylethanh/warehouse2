import 'transfer_logic_base.dart';

class CheckQuantityPacking extends TransferLogicBase {
  execute(String srcLocation, String destLocation, int productBarcodeId) async {
    final result = service.checkMaxQuantityQuickPacking(
        srcLocation, destLocation, productBarcodeId);
  }
}
