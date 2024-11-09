import 'dart:convert';

import 'package:books_app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

import 'package:books_app/core/exceptions/exceptions.dart';
import 'package:books_app/features/authors/data/model/author_model.dart';

abstract interface class AuthorData {
  Future<List<AuthorModel>> getAllAuthors();
}

class AuthorDataImpl implements AuthorData {
  final http.Client client;
  AuthorDataImpl({
    required this.client,
  });
  @override
  Future<List<AuthorModel>> getAllAuthors() async {
    try {
      final response = await client.get(Uri.parse(ApiConstants.authorsUrl));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body)['result'] as List;
        List<AuthorModel> authorList = decodedData
            .map(
              (authorMap) => AuthorModel.fromJson(
                json: authorMap,
              ),
            )
            .toList();
        return authorList;
      } else {
        throw ServerException(message: "No author found");
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
