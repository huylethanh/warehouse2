import '../../services/services.dart';

class AbortPickingSession {
  final _service = PickingService();

  Future<bool> execute(int pickId) async {
    await _service.abort(pickId);
    return false;
  }
}
