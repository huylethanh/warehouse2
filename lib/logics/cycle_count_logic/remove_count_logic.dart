import 'package:warehouse_app/models/models.dart';

import 'cycle_count_logic_base.dart';

class RemoveCountLogic extends CycleCountLogicBase {
  Future<bool> execute(int sessionId, CycleCountRemovePayload payload) {
    return service.remove(sessionId, payload);
  }
}
