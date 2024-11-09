import 'dart:convert';
import 'dart:developer';

import 'package:books_app/core/constants/api_constants.dart';
import 'package:books_app/core/exceptions/exceptions.dart';
import 'package:books_app/features/home/data/models/book_model.dart';
import 'package:http/http.dart' as http;

abstract interface class BookData {
  Future<List<BookModel>> getAllBooks();
}

class BookDataImpl implements BookData {
  final http.Client client;
  BookDataImpl({
    required this.client,
  });
  @override
  Future<List<BookModel>> getAllBooks() async {
    try {
      int limit = 10;
      final response = await client
          .get(Uri.parse(ApiConstants.allBooks(page: 1, limit: limit)));
          log(response.body.toString());
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        log("I'm indide");
        final decodedData = jsonDecode(response.body)['result'] as List;
        final List<BookModel> books = decodedData
            .map((bookJson) => BookModel.fromJson(json: bookJson))
            .toList();
            print(books);
        return books;
      } else {
        throw ServerException(message: "No books found");
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
