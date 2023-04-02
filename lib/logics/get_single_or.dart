import '../models/models.dart';
import '../services/services.dart';

class GetSingleOr {
  final service = PickingService();

  Future<ORPicking?> execute(int pickId) async {
    final result = await service.singleOr(pickId);

    if (result.hasError) {
      return null;
    }

    return result.data!;
  }
}
