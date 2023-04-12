import '../../services/services.dart';

class FinishRepick {
  final _service = RepickingService();

  Future<bool> execute(int pickId, int sessionId) async {
    final result = await _service.finish(pickId, sessionId);

    if (result.hasError) {
      return false;
    }

    return true;
  }
}
