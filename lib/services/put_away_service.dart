import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/result_set.dart';
import 'package:warehouse_app/services/service_base.dart';

import 'models/models.dart';

class PutAwayService extends ServiceBase {
  Future<ResultSet<PutAwaySessionResponse?>> registerTransport(
      String code) async {
    final request = CreatePutAwaySessionRequest(locationCode: code);

    final res = await client.createPutAwaySession(request.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(res.body);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<bool?>> process(
      int sessionId, PutAwayRequest request) async {
    final res = await client.putAwayProcess(sessionId, request.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(true);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<bool?>> finish(int sessionId, bool closeTransport) async {
    final res = await client.putAwayFinish(sessionId, closeTransport);

    if (res.isSuccessful) {
      return ResultSet.success(true);
    }

    return ResultSet.error(res.error);
  }
}
