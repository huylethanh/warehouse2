import '../models/models.dart';
import '../services/picking_service.dart';

class ProcessPicking {
  final service = PickingService();

  Future<PickProcessResponse?> execute(
      PickingLocation location, PickingProduct product) async {
    final result = await service.process(location, product);

    if (result.hasError) {
      return null;
    }

    return result.data!;
  }
}
