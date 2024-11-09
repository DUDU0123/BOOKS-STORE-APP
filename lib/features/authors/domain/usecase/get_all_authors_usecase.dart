
import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/usecase/usecase.dart';
import 'package:books_app/features/authors/domain/entity/author_entity.dart';
import 'package:books_app/features/authors/domain/repository/author_repo/author_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllAuthorsUsecase implements Usecase<List<AuthorEntity>, Null> {
  final AuthorRepository authorRepository;
  GetAllAuthorsUsecase({
    required this.authorRepository,
  });
  @override
  Future<Either<Failure, List<AuthorEntity>>> call({required Null params})async {
    return await authorRepository.getAllAuthors();
  }

}
