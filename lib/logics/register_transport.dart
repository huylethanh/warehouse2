import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/put_away_service.dart';

enum OPS { REG_TRANSPORT, REG_BIN, PROCESS, FINISH, RESUMING }

class RegisterTransport {
  final _service = PutAwayService();

  int sessionId = 0;

  String? registeredTransportCode = null;

  String? current() {
    return registeredTransportCode;
  }

  Future<PutAwaySessionResponse> registerTransport(String code) async {
    final result = await _service.registerTransport(code);
    final response = result.data;

    sessionId = response!.sessionId!;
    registeredTransportCode = code;

    return response;
  }
}
