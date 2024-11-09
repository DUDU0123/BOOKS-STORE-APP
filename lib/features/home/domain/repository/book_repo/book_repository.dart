import 'package:books_app/core/error/failure.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BookRepository{
  Future<Either<Failure, List<BookEntity>>> getAllBooks();
  Future<Either<Failure, bool>> addBookRating({
    required int starCount,
    required String bookId,required String jwtToken,
  });
}
