import 'package:warehouse_app/logics/cycle_count_logic/cycle_count_logic_base.dart';

import '../../models/models.dart';

class ProcessCountLogic extends CycleCountLogicBase {
  Future<bool> execute(int sessionId, CycleCountProcessPayload payload) {
    return service.process(sessionId, payload);
  }
}
