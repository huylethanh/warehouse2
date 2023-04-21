import 'package:warehouse_app/services/service_base.dart';

import '../models/models.dart';

class PartnerCycleCountService extends ServiceBase {
  Future<List<PartnerCycleCount>?> getPartners(
      int cycleCountType, int roundNumber) async {
    final response =
        await client.getPartnersCycleCount(cycleCountType, roundNumber);
    return response.body;
  }

  Future<PartnerCycleCount?> getPartnerDetail(
      int cycleCountId, int roundNumber) async {
    final response =
        await client.getPartnerDetailCycleCount(cycleCountId, roundNumber);
    return response.body;
  }
}
