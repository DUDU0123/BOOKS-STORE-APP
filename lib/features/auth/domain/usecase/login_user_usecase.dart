import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/usecase/usecase.dart';
import 'package:books_app/features/auth/domain/entity/user_entity.dart';
import 'package:books_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginUserUsecase implements Usecase<UserEntity,UserEntity> {
  final AuthRepository authRepository;
  LoginUserUsecase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, UserEntity>> call({required UserEntity params})async {
   return await authRepository.loginUser(userName: params.userName!, password: params.password!,);
  }
}
