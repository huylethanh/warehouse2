import '../../models/cycle_count_constain.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class PartnerCycleCountLogic {
  final service = PartnerCycleCountService();

  Future<List<PartnerCycleCount>?> getPartners(
      int cycleCountType, int roundNumber) {
    return service.getPartners(cycleCountType, roundNumber);
  }

  Future<PartnerCycleCount?> getPartnerDetail(int cycleCountId,
      {int roundNumber = CYCLE_COUNT}) {
    return service.getPartnerDetail(cycleCountId, roundNumber);
  }
}
