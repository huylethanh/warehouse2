import 'package:chopper/chopper.dart';
import 'package:warehouse_app/models/models.dart';

import 'chopper_clients.dart';

part 'authentication_client.chopper.dart';

@ChopperApi(baseUrl: "auth/")
abstract class AuthenticationClient extends ChopperService {
  static AuthenticationClient create() {
    final client = ChopperClients();
    return _$AuthenticationClient(client.loginClient);
  }

  @Post(path: 'login')
  Future<Response<AuthResponse>> login(@Body() Map<String, dynamic> request);
}
