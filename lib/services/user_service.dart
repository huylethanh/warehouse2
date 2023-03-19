import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/services/result_set.dart';
import 'package:warehouse_app/utils/login_reference.dart';

import 'client/index.dart';

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
