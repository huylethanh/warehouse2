import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/result_set.dart';

import 'client/app_client.dart';
import 'models/models.dart';

class PutAwayService {
  final _client = AppClient.create();

  Future<ResultSet<PutAwaySessionResponse?>> registerTransport(
      String code) async {
    final request = CreatePutAwaySessionRequest(locationCode: code);

    final res = await _client.createPutAwaySession(request.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(res.body);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<bool?>> process(
      int sessionId, PutAwayRequest request) async {
    final res = await _client.putAwayProcess(sessionId, request.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(true);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<bool?>> finish(int sessionId, bool closeTransport) async {
    final res = await _client.putAwayFinish(sessionId, closeTransport);

    if (res.isSuccessful) {
      return ResultSet.success(true);
    }

    return ResultSet.error(res.error);
  }
}
