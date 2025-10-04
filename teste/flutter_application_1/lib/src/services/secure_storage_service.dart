import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // Use const constructor onde suportado
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  Future<void> writeToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> readToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future getToken() async {}

  Future<void> saveToken(String text) async {}
}
