import 'package:warehouse_app/models/check_out_transport_request.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/result_set.dart';
import 'package:warehouse_app/services/service_base.dart';

class ReceiveService extends ServiceBase {
  Future<ResultSet<List<ReceiveModel>?>> checkingSessions(
      {bool unFinished = true}) async {
    final res = await client.checkinSessions(unFinished);

    if (res.isSuccessful) {
      return ResultSet.success(res.body ?? []);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<InboundResponse?>> fetchInboundRequest(int irId) async {
    final res = await client.inboundRequest(irId);

    if (res.isSuccessful) {
      return ResultSet.success(res.body);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<IdResponse?>> receiveCheckInTransport(
      String codeString, CheckInTransportRequest request) async {
    final res =
        await client.receiveCheckInTransport(codeString, request.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(res.body);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<bool?>> currentReceiveQuantity(
      int irId, int productId, int quantity, int unitId) async {
    final res = await client.currentReceiveQuantity(irId, productId, unitId);

    if (res.isSuccessful) {
      final check = res.body;

      final invalid =
          check!.actualQty! + check.exceptionQty! + quantity > check.expectQty!;

      return ResultSet.success(invalid);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<bool?>> receiveCheckOutTransport(
      String code, int sessionId) async {
    final res = await client.receiveCheckOutTransport(
        code, sessionId, CheckOutTransportRequest(note: "").toJson());

    if (res.isSuccessful) {
      return ResultSet.success(true);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<bool?>> processProduct(
      String code, int sessionId, CheckingProduct payload) async {
    final res =
        await client.receiveCheckProduct(code, sessionId, payload.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(true);
    }

    return ResultSet.error(res.error);
  }
}
