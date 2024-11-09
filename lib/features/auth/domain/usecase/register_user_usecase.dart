import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/usecase/usecase.dart';
import 'package:books_app/features/auth/domain/entity/user_entity.dart';
import 'package:books_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class RegisterUserUsecase implements Usecase<UserEntity,UserEntity> {
  final AuthRepository authRepository;
  RegisterUserUsecase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, UserEntity>> call({required UserEntity params})async {
   return await authRepository.registerUser(userName: params.userName!, password: params.password!,);
  }
}
