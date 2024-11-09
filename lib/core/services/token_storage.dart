import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const tokenKey = 'userBookAppToken';
  static const FlutterSecureStorage _flutterSecureStorage =
      FlutterSecureStorage();

  static Future<void> storeToken({required String token}) async {
    await _flutterSecureStorage.write(key: tokenKey, value: token);
  }

  static Future<String?> readToken() async {
    return await _flutterSecureStorage.read(key: tokenKey);
  }
  static Future<void> clearToken() async {
    await _flutterSecureStorage.delete(key: tokenKey);
  }
}
