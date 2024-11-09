import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/usecase/usecase.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/domain/repository/book_repo/book_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBooksUseCase implements Usecase<List<BookEntity>, Null> {
  final BookRepository bookRepository;
  GetAllBooksUseCase({
    required this.bookRepository,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> call({required Null params}) async {
    return await bookRepository.getAllBooks();
  }
}
