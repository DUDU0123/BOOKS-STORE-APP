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

/// An abstract class defining the contract for user authentication-related operations.
abstract interface class AuthData {
  // Registers a new user and returns a UserModel on success.
  Future<UserModel> registerUser({
    required String userName,
    required String password,
  });

  // Logs in an existing user and returns a UserModel on success.
  Future<UserModel> loginUser({
    required String userName,
    required String password,
  });

  // Checks if a user is logged in based on their authentication status.
  Future<bool> checkUserLoggedIn();

  // Logs out the user and clears their authentication token.
  Future<bool> logOutUser();
}
/// Concrete implementation of the AuthData interface that handles user registration, login, and authentication status.
class AuthDataImpl implements AuthData {
  final http.Client client; // The HTTP client used for making network requests.

  // Constructor to inject the http client dependency.
  AuthDataImpl({
    required this.client,
  });

  /// Registers a new user with the given username and password.
  @override
  Future<UserModel> registerUser({
    required String userName,
    required String password,
  }) async {
    try {
      // Send a POST request to register the user, with the provided username and password.
      final response =
          await client.post(Uri.parse(ApiConstants.registerUrl), body: {
        dbUserName: userName, // Username key.
        dbUserPassword: password, // Password key.
      });

      // If registration is successful (HTTP status 201), parse the response.
      if (response.statusCode == 201) {
        final decodedData = jsonDecode(response.body)['result']; // Decode the response body.
        log(name: "Decoded Data", decodedData.toString()); // Log the decoded data for debugging.

        // Extract the access token from the response data.
        final String? accessToken = decodedData['access_token'] as String?;

        // If a valid access token is found, create a UserModel and store the token.
        if (accessToken != null && accessToken.isNotEmpty) {
          final userModel = UserModel(
            userPassword: password, // Store password.
            username: userName, // Store username.
            userToken: accessToken, // Store access token.
          );
          await TokenStorage.storeToken(token: userModel.userToken!); // Store the token securely.
          await UserAuthStatus.setUserAuthStatus(); // Update the user's authentication status.
          return userModel; // Return the created UserModel.
        } else {
          // If the access token is not found or invalid, throw an exception.
          throw ServerException(
              message: "User not authenticated, no valid token found");
        }
      } else {
        log(name: "Error", '${response.statusCode}'); // Log error if registration fails.
        throw ServerException(message: "Unable to register user! Try later");
      }
    } on HttpException catch (e) {
      log(name: "Error", e.message); // Log any HTTP-specific exceptions.
      throw ServerException(message: e.message); // Throw custom exception with error message.
    } catch (e) {
      log(name: "Error", e.toString()); // Log any other exceptions.
      throw ServerException(message: e.toString()); // Throw custom exception with error message.
    }
  }

  /// Logs in an existing user with the provided username and password.
  @override
  Future<UserModel> loginUser({
    required String userName,
    required String password,
  }) async {
    try {
      // Send a POST request to log in the user with the provided username and password.
      final response =
          await client.post(Uri.parse(ApiConstants.loginUrl), body: {
        dbUserName: userName, // Username key.
        dbUserPassword: password, // Password key.
      });

      // If login is successful (HTTP status 201), parse the response.
      if (response.statusCode == 201) {
        final decodedData = jsonDecode(response.body)['result']; // Decode the response body.
        log(name: "Decoded Data", decodedData.toString()); // Log the decoded data for debugging.

        // Extract the access token from the response data.
        final String? accessToken = decodedData['access_token'] as String?;

        // If a valid access token is found, create a UserModel and store the token.
        if (accessToken != null && accessToken.isNotEmpty) {
          final userModel = UserModel(
            userPassword: password, // Store password.
            username: userName, // Store username.
            userToken: accessToken, // Store access token.
          );
          await TokenStorage.storeToken(token: accessToken); // Store the token securely.
          await UserAuthStatus.setUserAuthStatus(); // Update the user's authentication status.
          return userModel; // Return the created UserModel.
        } else {
          // If the access token is not found or invalid, throw an exception.
          throw ServerException(
              message: "User not authenticated, no valid token found");
        }
      } else {
        log(name: "Error", '${response.statusCode}'); // Log error if login fails.
        throw ServerException(message: "Unable to login user! Try later");
      }
    } on HttpException catch (e) {
      log(name: "Error", e.message); // Log any HTTP-specific exceptions.
      throw ServerException(message: e.message); // Throw custom exception with error message.
    } catch (e) {
      log(name: "Error", e.toString()); // Log any other exceptions.
      throw ServerException(message: e.toString()); // Throw custom exception with error message.
    }
  }

  /// Checks if a user is currently logged in by verifying their authentication status.
  @override
  Future<bool> checkUserLoggedIn() async {
    try {
      // Retrieve the stored user token.
      final String? token = await UserAuthStatus.getUserAuthStatus();
      log("User token $token"); // Log the token for debugging.

      // Return true if the token is not null or empty (indicating the user is logged in).
      return token != null && token.isNotEmpty;
    } catch (e) {
      log('Error in getAuthStatus: ${e.toString()}'); // Log any errors during the process.
      throw ServerException(message: e.toString()); // Throw custom exception with error message.
    }
  }

  /// Logs out the current user by clearing the stored token and updating the authentication status.
  @override
  Future<bool> logOutUser() async {
    try {
      await TokenStorage.clearToken(); // Clear the stored token.
      await UserAuthStatus.setUserAuthStatus(); // Update the user's authentication status.
      return true; // Return true indicating logout was successful.
    } catch (e) {
      log(e.toString()); // Log any errors during the logout process.
      throw ServerException(message: e.toString()); // Throw custom exception with error message.
    }
  }
}
