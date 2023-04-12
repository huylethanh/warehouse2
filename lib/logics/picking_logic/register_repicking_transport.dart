import 'package:warehouse_app/models/models.dart';

import '../../services/repicking_service.dart';

class RegisterRepickingTransport {
  final _service = RepickingService();

  String? transportCode = null;

  Future<PickingPath?> execute(String transport) async {
    final result = await _service.registerRepicTransport(transport);

    if (result.hasError) {
      return null;
    }

    return result.data!;
  }
}
