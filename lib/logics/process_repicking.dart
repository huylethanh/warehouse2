import 'package:warehouse_app/services/services.dart';

import '../models/models.dart';

class ProcessRepick {
  final service = RepickingService();

  Future<PickProcessResponse?> execute(
      PickingLocation location, PickingProduct product) async {
    final result = await service.process(location, product);

    if (result.hasError) {
      return null;
    }

    return result.data!;
  }
}
