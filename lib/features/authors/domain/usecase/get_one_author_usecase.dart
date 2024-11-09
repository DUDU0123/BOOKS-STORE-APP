
import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/usecase/usecase.dart';
import 'package:books_app/features/authors/domain/entity/author_entity.dart';
import 'package:books_app/features/authors/domain/repository/author_repo/author_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetOneAuthorUsecase implements Usecase<AuthorEntity, String> {
  final AuthorRepository authorRepository;
  GetOneAuthorUsecase({
    required this.authorRepository,
  });
  @override
  Future<Either<Failure, AuthorEntity>> call({required String params})async {
    return await authorRepository.getOneAuthor(authorId: params);
  }

}
