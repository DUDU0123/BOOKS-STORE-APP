import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/exceptions/exceptions.dart';
import 'package:books_app/features/authors/data/data_source/author_data/author_data.dart';
import 'package:books_app/features/authors/domain/entity/author_entity.dart';
import 'package:books_app/features/authors/domain/repository/author_repo/author_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthorRepoImpl implements AuthorRepository {
  final AuthorData authorData;
  AuthorRepoImpl({
    required this.authorData,
  });
  @override
  Future<Either<Failure, List<AuthorEntity>>> getAllAuthors() async {
    try {
      final authorList = await authorData.getAllAuthors();
      return right(authorList);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, AuthorEntity>> getOneAuthor({required String authorId}) async{
     try {
      final author = await authorData.getOneAuthor(authorId: authorId);
      return right(author);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
