import 'package:books_app/config/theme/theme_manager/theme_manager_cubit.dart';
import 'package:books_app/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:books_app/features/main_nav/presentation/bloc/bottom_nav/bottom_navigation_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

initDependencies() {
  serviceLocator.registerLazySingleton<ThemeManagerCubit>(
    () => ThemeManagerCubit(),
  );
  serviceLocator.registerLazySingleton<BottomNavigationCubit>(
    () => BottomNavigationCubit(),
  );
  initAuthDependencies();
}

initAuthDependencies() {
  serviceLocator.registerLazySingleton<AuthenticationBloc>(
    () => AuthenticationBloc(),
  );
}
