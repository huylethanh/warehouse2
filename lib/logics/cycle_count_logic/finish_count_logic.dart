import 'package:warehouse_app/logics/cycle_count_logic/cycle_count_logic_base.dart';

class FinishCountLogic extends CycleCountLogicBase {
  Future<bool> execute(int sessionId) {
    return service.finish(sessionId);
  }
}
