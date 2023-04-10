import '../models/models.dart';
import '../services/services.dart';

class RepickAllInBin {
  final _service = RepickingService();

  Future<PickProcessResponse?> execute(PickingLocation location) async {
    final result = await _service.allInBin(location);

    if (result.hasError) {
      return null;
    }

    return result.data!;
  }
}
