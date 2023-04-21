import 'package:warehouse_app/services/service_base.dart';

import '../models/models.dart';

class CycleCountService extends ServiceBase {
  Future<CycleCountSessionResponse?> start(int cycleCountId,
      String locationCode, int roundNumber, int cycleCountType) async {
    final request = CycleCountSessionRequest(
        cycleCountId: cycleCountId,
        locationCode: locationCode,
        cycleCountType: cycleCountType,
        roundNumber: roundNumber);
    final response = await client.startSessionCycleCount(request.toJson());

    return response.body;
  }

  Future<CycleCountSession?> getSessionDetails(int sessionId) async {
    final response = await client.getProductsCycleCount(sessionId);
    return response.body;
  }

  Future<bool> process(int sessionId, CycleCountProcessPayload payload) async {
    final response = await client.processCount(sessionId, payload.toJson());

    return response.isSuccessful;
  }

  Future<bool> remove(int sessionId, CycleCountRemovePayload payload) async {
    final response = await client.removeCount(sessionId, payload.toJson());

    return response.isSuccessful;
  }

  Future<bool> finish(int sessionId) async {
    final response = await client.finishSessionCycleCount(sessionId);

    return response.isSuccessful;
  }
}
