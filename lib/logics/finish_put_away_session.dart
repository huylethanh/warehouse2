import 'package:warehouse_app/services/services.dart';

class FinishPutAwaySessio {
  final _service = PutAwayService();

  bool progressStarted = false;
  bool finished = false;

  void startProgress() {
    progressStarted = true;
    finished = false;
  }

  Future<bool> execute(int sessionId, bool closeTransport) async {
    if (!finished) {
      final resutl = await _service.finish(sessionId, closeTransport);

      if (resutl.hasError) {
        return false;
      }

      finished = true;
      return resutl.data!;
    }

    return false;
  }
}
