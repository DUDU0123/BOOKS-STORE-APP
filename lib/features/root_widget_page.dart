import 'package:books_app/config/routes/router.dart';
import 'package:books_app/config/theme/theme_constants.dart';
import 'package:books_app/config/theme/theme_manager/theme_manager_cubit.dart';
import 'package:books_app/core/service_locator/service_locator.dart';
import 'package:books_app/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:books_app/features/home/presentation/bloc/bloc/book_bloc.dart';
import 'package:books_app/features/main_nav/presentation/bloc/bottom_nav/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AuthenticationBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<BottomNavigationCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<ThemeManagerCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<BookBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: ThemeConstants.lightTheme,
            darkTheme: ThemeConstants.darkTheme,
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
