import '../../models/models.dart';
import 'cycle_count_logic_base.dart';

class GetSessionCountLogic extends CycleCountLogicBase {
  Future<CycleCountSession?> execute(int sessionId) {
    return service.getSessionDetails(sessionId);
  }
}
