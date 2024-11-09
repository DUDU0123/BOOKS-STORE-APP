import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:books_app/core/constants/database_constants.dart';
import 'package:books_app/core/services/token_storage.dart';
import 'package:books_app/core/services/user_auth_status.dart';
import 'package:books_app/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:books_app/core/constants/api_constants.dart';
import 'package:books_app/core/exceptions/exceptions.dart';

abstract interface class AuthData {
  Future<UserModel> registerUser({
    required String userName,
    required String password,
  });
  Future<UserModel> loginUser({
    required String userName,
    required String password,
  });
  Future<bool> checkUserLoggedIn();
  Future<bool> logOutUser();
}

class AuthDataImpl implements AuthData {
  final http.Client client;
  AuthDataImpl({
    required this.client,
  });
  @override
  Future<UserModel> registerUser({
    required String userName,
    required String password,
  }) async {
    try {
      final response =
          await client.post(Uri.parse(ApiConstants.registerUrl), body: {
        dbUserName: userName,
        dbUserPassword: password,
      });
      if (response.statusCode == 201) {
        final decodedData = jsonDecode(response.body)['result'];
        log(name: "Decoded Data", decodedData.toString());
        final String? accessToken = decodedData['access_token'] as String?;
        if (accessToken != null && accessToken.isNotEmpty) {
          final userModel = UserModel(
            userPassword: password,
            username: userName,
            userToken: accessToken,
          );
          await TokenStorage.storeToken(token: userModel.userToken!);
          await UserAuthStatus.setUserAuthStatus();
          return userModel;
        } else {
          throw ServerException(
              message: "User not authenticated, no valid token found");
        }
      } else {
        log(name: "Error", '${response.statusCode}');
        throw ServerException(message: "Unable to register user! Try later");
      }
    } on HttpException catch (e) {
      log(name: "Error", e.message);
      throw ServerException(message: e.message);
    } catch (e) {
      log(name: "Error", e.toString());
      throw ServerException(message: e.toString());
    }
  }
  @override
  Future<UserModel> loginUser({
    required String userName,
    required String password,
  }) async {
    try {
      final response =
          await client.post(Uri.parse(ApiConstants.loginUrl), body: {
        dbUserName: userName,
        dbUserPassword: password,
      });
      if (response.statusCode == 201) {
        final decodedData = jsonDecode(response.body)['result'];
        log(name: "Decoded Data", decodedData.toString());
        final String? accessToken = decodedData['access_token'] as String?;
        if (accessToken != null && accessToken.isNotEmpty) {
          final userModel = UserModel(
            userPassword: password,
            username: userName,
            userToken: accessToken,
          );
          await TokenStorage.storeToken(token: accessToken);
          await UserAuthStatus.setUserAuthStatus();
          return userModel;
        } else {
          throw ServerException(
              message: "User not authenticated, no valid token found");
        }
      } else {
        log(name: "Error", '${response.statusCode}');
        throw ServerException(message: "Unable to register user! Try later");
      }
    } on HttpException catch (e) {
      log(name: "Error", e.message);
      throw ServerException(message: e.message);
    } catch (e) {
      log(name: "Error", e.toString());
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<bool> checkUserLoggedIn() async {
    try {
      final String? token = await UserAuthStatus.getUserAuthStatus();
      log("User token $token");
      return token != null && token.isNotEmpty;
    } catch (e) {
      log('Error in getAuthStatus: ${e.toString()}');
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<bool> logOutUser() async {
    try {
      await TokenStorage.clearToken();
      await UserAuthStatus.setUserAuthStatus();
      return true;
    } catch (e) {
       log(e.toString());
      throw ServerException(message: e.toString());
    }
  }
}
