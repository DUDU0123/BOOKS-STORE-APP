import 'dart:convert';
import 'dart:developer';
import 'package:books_app/core/constants/api_constants.dart';
import 'package:books_app/core/exceptions/exceptions.dart';
import 'package:books_app/features/home/data/models/book_model.dart';
import 'package:http/http.dart' as http;

abstract interface class BookData {
  // abstract method for get all books
  Future<List<BookModel>> getAllBooks();
  // abstract method for rating add
  Future<bool> addBookRating({
    required int starCount,
    required String bookId,required String jwtToken,
  });
}

// a class that implement all methods of book data abstract class
class BookDataImpl implements BookData {
  final http.Client client;
  BookDataImpl({
    required this.client,
  });
  // implementation for getall books method
  @override
  Future<List<BookModel>> getAllBooks() async {
    try {
      int limit = 10;
      final response = await client
          .get(Uri.parse(ApiConstants.allBooks(page: 1, limit: limit)));
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final decodedData = jsonDecode(response.body)['result'] as List;
        final List<BookModel> books = decodedData
            .map((bookJson) => BookModel.fromJson(json: bookJson))
            .toList();
        return books;
      } else {
        throw ServerException(message: "No books found");
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  // implementation for add book rating method
  @override
  Future<bool> addBookRating({
    required int starCount,
    required String bookId,required String jwtToken,
  }) async {
    try {
      final response = await client.post(
        Uri.parse(ApiConstants.addRating(id: bookId)),
        headers: {
        'Authorization': 'Bearer $jwtToken', // Add the JWT token in the headers
      },
        body: jsonEncode({
          "rating": starCount.toString(),
        }),
      );
      if (response.statusCode == 200) {
        log(response.body);
        return true;
      } else {
        log("${response.body}");
        throw ServerException(message: "Cannot add rating");
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  //get one book by id method
  Future<BookModel> getOneBook({required String bookId}) async {
    try {
      final response =
          await client.get(Uri.parse(ApiConstants.oneBook(bookId: bookId)));
      log(response.body.toString());
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final decodedData =
            jsonDecode(response.body)['result'] as Map<String, dynamic>;
        return BookModel.fromJson(json: decodedData);
      } else {
        throw ServerException(message: "Book not found");
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
