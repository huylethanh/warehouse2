import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginReference {
  static final LoginReference _instance = LoginReference._internal();

  factory LoginReference() {
    return _instance;
  }

  LoginReference._internal();

  final _storage = const FlutterSecureStorage();

  String? accessToken;
  String? refreshToken;
  String? username;

  void saveReference(String accessToken, String refreshToken, String username) {
    _storage.write(key: "accessToken", value: accessToken);
    this.accessToken = accessToken;

    _storage.write(key: "refreshToken", value: refreshToken);
    this.refreshToken = refreshToken;

    _storage.write(key: "username", value: username);
    this.username = username;
  }

  Future<void> readAll() async {
    accessToken = await _storage.read(key: "accessToken");
    refreshToken = await _storage.read(key: "refreshToken");
    username = await _storage.read(key: "username");
  }

  Future<void> clearAll() async {
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
    await _storage.delete(key: 'username');
    await readAll();
  }
}
