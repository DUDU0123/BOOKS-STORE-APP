import 'package:books_app/core/services/token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthStatus {
  static const userAuthStatus = 'ISTOKENFOUND';
  static Future<void> setUserAuthStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? userToken = await TokenStorage.readToken();
    sharedPreferences.setString(userAuthStatus, userToken??'');
  }
  static Future<String?> getUserAuthStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userAuthStatus);
  }
}