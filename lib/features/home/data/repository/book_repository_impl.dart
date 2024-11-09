import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/exceptions/exceptions.dart';
import 'package:books_app/features/home/data/data_sources/book_data/book_data.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/domain/repository/book_repo/book_repository.dart';
import 'package:fpdart/fpdart.dart';

class BookRepositoryImpl implements BookRepository {
  final BookData bookData;
  BookRepositoryImpl({
    required this.bookData,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> getAllBooks({required int page}) async {
    try {
      final bookList = await bookData.getAllBooks(page: page);
      return right(bookList);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addBookRating({
    required int starCount,
    required String bookId,
  }) async {
    try {
      final isRatingAdded = await bookData.addBookRating(
        starCount: starCount,
        bookId: bookId,
      );
      return right(isRatingAdded);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
