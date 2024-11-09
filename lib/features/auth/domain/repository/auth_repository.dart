import 'package:books_app/core/error/failure.dart';
import 'package:books_app/features/auth/domain/entity/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> registerUser({
    required String userName,
    required String password,
  });
  Future<Either<Failure, UserEntity>> loginUser({
    required String userName,
    required String password,
  });
  Future<Either<Failure, bool>> checkUserLoggedIn();
  Future<Either<Failure, bool>> logOutUser();
}