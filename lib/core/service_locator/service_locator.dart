import 'package:books_app/config/theme/theme_manager/theme_manager_cubit.dart';
import 'package:books_app/features/auth/data/data_sources/auth_data/auth_data.dart';
import 'package:books_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:books_app/features/auth/domain/repository/auth_repository.dart';
import 'package:books_app/features/auth/domain/usecase/check_user_loggedin_usecase.dart';
import 'package:books_app/features/auth/domain/usecase/login_user_usecase.dart';
import 'package:books_app/features/auth/domain/usecase/logout_user_usecase.dart';
import 'package:books_app/features/auth/domain/usecase/register_user_usecase.dart';
import 'package:books_app/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:books_app/features/home/data/data_sources/book_data/book_data.dart';
import 'package:books_app/features/home/data/repository/book_repository_impl.dart';
import 'package:books_app/features/home/domain/repository/book_repo/book_repository.dart';
import 'package:books_app/features/home/domain/usecase/get_all_books.dart';
import 'package:books_app/features/home/presentation/bloc/bloc/book_bloc.dart';
import 'package:books_app/features/main_nav/presentation/bloc/bottom_nav/bottom_navigation_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt serviceLocator = GetIt.instance;

initDependencies() {
  serviceLocator.registerLazySingleton<ThemeManagerCubit>(
    () => ThemeManagerCubit(),
  );
  serviceLocator.registerFactory<http.Client>(
    () => http.Client(),
  );
  serviceLocator.registerLazySingleton<BottomNavigationCubit>(
    () => BottomNavigationCubit(),
  );

  initAuthDependencies();
  initBookDependencies();
}

initAuthDependencies() {
  serviceLocator
    ..registerFactory<AuthData>(
      () => AuthDataImpl(
        client: serviceLocator<http.Client>(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        authData: serviceLocator<AuthData>(),
      ),
    )
    ..registerFactory<RegisterUserUsecase>(
      () => RegisterUserUsecase(
        authRepository: serviceLocator<AuthRepository>(),
      ),
    )
    ..registerFactory<LoginUserUsecase>(
      () => LoginUserUsecase(
        authRepository: serviceLocator<AuthRepository>(),
      ),
    )
    ..registerFactory<LogoutUserUsecase>(
      () => LogoutUserUsecase(
        authRepository: serviceLocator<AuthRepository>(),
      ),
    )
    ..registerFactory<CheckUserLoggedinUsecase>(
      () => CheckUserLoggedinUsecase(
        authRepository: serviceLocator<AuthRepository>(),
      ),
    )
    ..registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc(
        checkUserLoggedinUsecase: serviceLocator<CheckUserLoggedinUsecase>(),
        loginUserUsecase: serviceLocator<LoginUserUsecase>(),
        logoutUserUsecase: serviceLocator<LogoutUserUsecase>(),
        registerUserUsecase: serviceLocator<RegisterUserUsecase>(),
      ),
    );
}
initBookDependencies() {
  serviceLocator
    ..registerFactory<BookData>(
      () => BookDataImpl(
        client: serviceLocator<http.Client>(),
      ),
    )
    ..registerFactory<BookRepository>(
      () => BookRepositoryImpl(
        bookData: serviceLocator<BookData>(),
      ),
    )
    ..registerFactory<GetAllBooksUseCase>(
      () => GetAllBooksUseCase(
        bookRepository: serviceLocator<BookRepository>(),
      ),
    )
    ..registerLazySingleton<BookBloc>(
      () => BookBloc(
        getAllBooksUsecase: serviceLocator<GetAllBooksUseCase>(),
      ),
    );
}
initAuthorDependencies() {
  serviceLocator
    ..registerFactory<BookData>(
      () => BookDataImpl(
        client: serviceLocator<http.Client>(),
      ),
    )
    ..registerFactory<BookRepository>(
      () => BookRepositoryImpl(
        bookData: serviceLocator<BookData>(),
      ),
    )
    ..registerFactory<GetAllBooksUseCase>(
      () => GetAllBooksUseCase(
        bookRepository: serviceLocator<BookRepository>(),
      ),
    )
    ..registerLazySingleton<BookBloc>(
      () => BookBloc(
        getAllBooksUsecase: serviceLocator<GetAllBooksUseCase>(),
      ),
    );
}
