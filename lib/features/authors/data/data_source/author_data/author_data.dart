import 'dart:convert';

import 'package:books_app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

import 'package:books_app/core/exceptions/exceptions.dart';
import 'package:books_app/features/authors/data/model/author_model.dart';

/// An abstract class defining the data layer contract for Author data fetching.
abstract interface class AuthorData {
  /// Fetches all authors from the API and returns a list of AuthorModel.
  Future<List<AuthorModel>> getAllAuthors();
}

/// A concrete implementation of the AuthorData interface that handles API calls.
class AuthorDataImpl implements AuthorData {
  final http.Client client; // The http client used for making network requests.

  // Constructor to inject the http client dependency.
  AuthorDataImpl({
    required this.client,
  });

  /// Fetches a list of authors from the API and maps it to a list of AuthorModel objects.
  @override
  Future<List<AuthorModel>> getAllAuthors() async {
    try {
      // Make a GET request to fetch authors data from the API.
      final response = await client.get(Uri.parse(ApiConstants.authorsUrl));

      // Check if the response status is 200 (OK).
      if (response.statusCode == 200) {
        // Decode the response body into a map and extract the 'result' field, which contains the list of authors.
        final decodedData = jsonDecode(response.body)['result'] as List;

        // Map the list of authors into a List<AuthorModel> using the AuthorModel.fromJson method.
        List<AuthorModel> authorList = decodedData
            .map(
              // Convert each author data (Map) to an AuthorModel object.
              (authorMap) => AuthorModel.fromJson(
                json: authorMap,
              ),
            )
            .toList(); // Convert the iterable into a List<AuthorModel>.

        return authorList; // Return the list of AuthorModel objects.
      } else {
        // If the API response status code is not 200, throw a custom ServerException.
        throw ServerException(message: "No author found");
      }
    } catch (e) {
      // In case of any exception (e.g., network issue), throw a custom ServerException with the error message.
      throw ServerException(message: e.toString());
    }
  }
}
