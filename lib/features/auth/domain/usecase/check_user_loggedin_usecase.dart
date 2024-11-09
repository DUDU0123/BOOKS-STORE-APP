import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/usecase/usecase.dart';
import 'package:books_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CheckUserLoggedinUsecase implements Usecase<bool,Null> {
  final AuthRepository authRepository;
  CheckUserLoggedinUsecase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, bool>> call({required Null params})async {
   return await authRepository.checkUserLoggedIn();
  }
}
