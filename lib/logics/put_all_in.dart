import 'package:warehouse_app/services/services.dart';

class PutAllIn {
  final _service = PutAwayService();

  Future<bool> execute(int sessionId, String transportCode, String bin) async {
    final payload = PutAwayRequest(
        processAll: true,
        destLocationCode: bin.toUpperCase(),
        transportCode: transportCode);

    final result = await _service.process(sessionId, payload);

    if (result.hasError) {
      return false;
    }

    return result.data ?? false;
  }
}
