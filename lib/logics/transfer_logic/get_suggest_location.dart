import '../../models/models.dart';
import '../../services/services.dart';

class GetSuggestLocation {
  final service = PutAwayService();

  Future<SuggestLocation?> fetchSuggestLocations(
      int productId, int unitId, int conditionTypeId) async {
    final result =
        await service.fetchSuggestLocations(productId, unitId, conditionTypeId);

    return result.data;
  }
}
