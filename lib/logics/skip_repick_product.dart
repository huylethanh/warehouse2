import 'package:warehouse_app/models/models.dart';

import '../services/services.dart';

class SkipRepickProduct {
  final service = RepickingService();

  Future<PickingPath?> execute(int pickId, int sessionId,
      PickingLocation location, PickingProduct product) async {
    final result = await service.skip(pickId, sessionId, location, product);

    if (result.hasError) {
      return null;
    }

    return result.data!;
  }
}
