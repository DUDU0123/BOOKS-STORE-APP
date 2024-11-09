import 'package:books_app/core/error/failure.dart';
import 'package:books_app/features/authors/domain/entity/author_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthorRepository {
  Future<Either<Failure, List<AuthorEntity>>> getAllAuthors();
  Future<Either<Failure, AuthorEntity>> getOneAuthor({required String authorId});
}