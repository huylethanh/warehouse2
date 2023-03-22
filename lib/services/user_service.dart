import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/utils/login_reference.dart';

import 'client/client.dart';

class UserService {
  final loginClient = AuthenticationClient.create();

  Future<bool> login(String username, String password) async {
    final result = await loginClient
        .login(AuthRequest(username: username, password: password).toJson());

    if (result.isSuccessful) {
      final login = result.body!;
      LoginReference()
          .saveReference(login.accessToken!, login.refreshToken!, username);
      return true;
    }

    return false;
  }
}
