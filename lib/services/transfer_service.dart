import '../models/models.dart';
import 'service_base.dart';

class TranferService extends ServiceBase {
  Future<int> checkMaxQuantityQuickPacking(
      String srcLocation, String destLocation, int productBarcodeId) async {
    final result = await client.checkMaxQuantityQuickPacking(
        srcLocation, destLocation, productBarcodeId);

    return result.body ?? 0;
  }

  Future<int> openSourceLocation(String code) async {
    final result = await client.startTransferring(code);
    return result.body!.id;
  }

  Future<bool> regDestLocation(int sessionId, String code) async {
    final response =
        await client.regDest(sessionId, TransferRegDestBody(code).toJson());

    return response.isSuccessful;
  }

  Future<bool> transferBINToBIN(int sessionId, String src, String dest,
      TransferProduct product, int quantity) async {
    final payload = TransferRequest(
        processAll: false,
        destLocationCode: dest,
        sourceLocationCode: src,
        productBarcodeId: product.productId,
        storageCode: product.serial,
        quantity: quantity);

    final response = await client.processTransfer(sessionId, payload.toJson());

    return response.isSuccessful;
  }

  Future<bool> transferAllBINToBIN(
      int sessionId, String src, String dest) async {
    final payload = TransferRequest(
      processAll: true,
      destLocationCode: dest,
      sourceLocationCode: src,
    );

    final response = await client.processTransfer(sessionId, payload.toJson());

    return response.isSuccessful;
  }

  Future<bool> closeSourceLocation(int sessionId) async {
    final response = await client.finishTransferring(sessionId);

    return response.isSuccessful;
  }
}
