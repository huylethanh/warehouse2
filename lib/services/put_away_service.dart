import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/services/result_set.dart';

import 'client/app_client.dart';

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
}
