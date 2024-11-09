import 'dart:convert';
import 'dart:developer';
import 'package:books_app/core/constants/api_constants.dart';
import 'package:books_app/core/exceptions/exceptions.dart';
import 'package:books_app/features/home/data/models/book_model.dart';
import 'package:http/http.dart' as http;

// Abstract interface class defining the contract for book data operations
abstract interface class BookData {
  // Abstract method to get all books
  Future<List<BookModel>> getAllBooks({required int page});

  // Abstract method to add a rating for a book
  Future<bool> addBookRating({
    required int starCount, // The rating value (e.g., number of stars)
    required String bookId, // ID of the book to rate
    required String jwtToken, // JWT token for authorization
  });
}

// Class that implements all the methods of the BookData abstract class
class BookDataImpl implements BookData {
  final http.Client client; // HTTP client used for making network requests

  // Constructor for injecting the HTTP client dependency
  BookDataImpl({
    required this.client,
  });

  // Implementation of the method to get all books
  @override
  Future<List<BookModel>> getAllBooks({required int page}) async {
    try {
      int limit = 10; // Limit for the number of books fetched
      final response = await client
          .get(Uri.parse(ApiConstants.allBooks(page: 1, limit: limit))); // API call to fetch books

      // Check if the response is successful and not empty
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final decodedData = jsonDecode(response.body)['result'] as List; // Decode the JSON response
        final List<BookModel> books = decodedData
            .map((bookJson) => BookModel.fromJson(json: bookJson)) // Convert JSON to BookModel objects
            .toList();
        return books; // Return the list of books
      } else {
        throw ServerException(message: "No books found"); // Throw exception if no books found
      }
    } catch (e) {
      throw ServerException(message: e.toString()); // Handle any errors and throw a custom exception
    }
  }

  // Implementation of the method to add a rating for a book
  @override
  Future<bool> addBookRating({
    required int starCount, // The rating value to be added
    required String bookId, // ID of the book to which the rating is added
    required String jwtToken, // JWT token for authorization
  }) async {
    try {
      // API call to add a rating to the specified book
      final response = await client.post(
        Uri.parse(ApiConstants.addRating(id: bookId)),
        headers: {
          'Authorization': 'Bearer $jwtToken', // Include the JWT token in the request headers
        },
        body: jsonEncode({
          "rating": starCount.toString(), // Encode the star count as a string in the request body
        }),
      );

      // Check if the response indicates success
      if (response.statusCode == 200) {
        log(response.body); // Log the response body for debugging
        return true; // Return true if the rating was successfully added
      } else {
        log("${response.body}"); // Log the response body for debugging if not successful
        throw ServerException(message: "Cannot add rating"); // Throw exception if the rating couldn't be added
      }
    } catch (e) {
      throw ServerException(message: e.toString()); // Handle any errors and throw a custom exception
    }
  }

  // Method to get a single book by its ID
  Future<BookModel> getOneBook({required String bookId}) async {
    try {
      // API call to fetch a single book by its ID
      final response =
          await client.get(Uri.parse(ApiConstants.oneBook(bookId: bookId)));
      log(response.body.toString()); // Log the response body for debugging

      // Check if the response is successful and not empty
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final decodedData =
            jsonDecode(response.body)['result'] as Map<String, dynamic>; // Decode the JSON response
        return BookModel.fromJson(json: decodedData); // Convert JSON to a BookModel object
      } else {
        throw ServerException(message: "Book not found"); // Throw exception if the book was not found
      }
    } catch (e) {
      throw ServerException(message: e.toString()); // Handle any errors and throw a custom exception
    }
  }
}
