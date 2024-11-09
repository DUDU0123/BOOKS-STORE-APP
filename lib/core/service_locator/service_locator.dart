import 'package:books_app/config/theme/theme_manager/theme_manager_cubit.dart';
import 'package:books_app/features/auth/data/data_sources/auth_data/auth_data.dart';
import 'package:books_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:books_app/features/auth/domain/repository/auth_repository.dart';
import 'package:books_app/features/auth/domain/usecase/check_user_loggedin_usecase.dart';
import 'package:books_app/features/auth/domain/usecase/login_user_usecase.dart';
import 'package:books_app/features/auth/domain/usecase/logout_user_usecase.dart';
import 'package:books_app/features/auth/domain/usecase/register_user_usecase.dart';
import 'package:books_app/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:books_app/features/authors/data/data_source/author_data/author_data.dart';
import 'package:books_app/features/authors/data/repository/author_repo/author_repo_impl.dart';
import 'package:books_app/features/authors/domain/repository/author_repo/author_repository.dart';
import 'package:books_app/features/authors/domain/usecase/get_all_authors_usecase.dart';
import 'package:books_app/features/authors/presentation/bloc/author/author_bloc.dart';
import 'package:books_app/features/description/presentation/bloc/cubit/description_cubit.dart';
import 'package:books_app/features/home/data/data_sources/book_data/book_data.dart';
import 'package:books_app/features/home/data/repository/book_repository_impl.dart';
import 'package:books_app/features/home/domain/repository/book_repo/book_repository.dart';
import 'package:books_app/features/home/domain/usecase/add_book_rating_usecase.dart';
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
  serviceLocator.registerLazySingleton<DescriptionCubit>(
    () => DescriptionCubit(),
  );

  initAuthDependencies();
  initBookDependencies();
  initAuthorDependencies();
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
    ..registerFactory<AddBookRatingUsecase>(
      () => AddBookRatingUsecase(
        bookRepository: serviceLocator<BookRepository>(),
      ),
    )
    ..registerLazySingleton<BookBloc>(
      () => BookBloc(
        getAllBooksUsecase: serviceLocator<GetAllBooksUseCase>(),
        addBookRatingUsecase: serviceLocator<AddBookRatingUsecase>(),
      ),
    );
}
initAuthorDependencies() {
  serviceLocator
    ..registerFactory<AuthorData>(
      () => AuthorDataImpl(
        client: serviceLocator<http.Client>(),
      ),
    )
    ..registerFactory<AuthorRepository>(
      () => AuthorRepoImpl(
        authorData: serviceLocator<AuthorData>(),
      ),
    )
    ..registerFactory<GetAllAuthorsUsecase>(
      () => GetAllAuthorsUsecase(
        authorRepository: serviceLocator<AuthorRepository>(),
      ),
    )
    ..registerLazySingleton<AuthorBloc>(
      () => AuthorBloc(
        getAllAuthorsUsecase: serviceLocator<GetAllAuthorsUsecase>(),
      ),
    );
}
