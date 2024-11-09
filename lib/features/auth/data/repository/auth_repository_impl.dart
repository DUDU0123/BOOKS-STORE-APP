import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/exceptions/exceptions.dart';
import 'package:books_app/features/auth/data/data_sources/auth_data/auth_data.dart';
import 'package:books_app/features/auth/domain/entity/user_entity.dart';
import 'package:books_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthData authData;
  AuthRepositoryImpl({
    required this.authData,
  });

  @override
  Future<Either<Failure, bool>> checkUserLoggedIn() async {
    try {
      final isLoggedIn = await authData.checkUserLoggedIn();
      return right(isLoggedIn);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logOutUser() async {
    try {
      final isLoggedOut = await authData.logOutUser();
      return right(isLoggedOut);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser(
      {required String userName, required String password}) async {
    try {
      final user = await authData.loginUser(
        userName: userName,
        password: password,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerUser(
      {required String userName, required String password}) async {
    try {
      final user = await authData.registerUser(
        userName: userName,
        password: password,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
