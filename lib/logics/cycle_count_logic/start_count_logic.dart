
import 'package:warehouse_app/logics/cycle_count_logic/cycle_count_logic_base.dart';
import 'package:warehouse_app/models/cycle_count_constain.dart';

import '../../models/models.dart';

class StartCountLogic extends CycleCountLogicBase {
  Future<CycleCountSessionResponse?> execute(
      {int cycleCountId = 0,
      required String locationCode,
      int roundNumber = 1, // 1 is cycle-count, 2 is verify cycle-count
      int cycleCountType =
          RANDOM} // 1 is random-cycle-count, 2 is partner-cycle-count
      ) async {
    return service.start(
        cycleCountId, locationCode, roundNumber, cycleCountType);
  }
}
