import 'package:books_app/config/routes/app_routes_name.dart';
import 'package:books_app/features/auth/presentation/pages/login/login_page.dart';
import 'package:books_app/features/auth/presentation/pages/register/register_page.dart';
import 'package:books_app/features/authors/presentation/pages/authors_page.dart';
import 'package:books_app/features/description/presentation/pages/book_description.dart';
import 'package:books_app/features/home/presentation/pages/home_page.dart';
import 'package:books_app/features/main_nav/presentation/pages/main_entry_page.dart';
import 'package:books_app/features/splash/presentation/pages/books_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutesName.splashIntro,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutesName.register,
      name: AppRoutesName.register,
      builder: (context, state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: AppRoutesName.login,
      name: AppRoutesName.login,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: AppRoutesName.splashIntro,
      name: AppRoutesName.splashIntro,
      builder: (context, state) {
        return const BooksSplashScreen();
      },
    ),
    GoRoute(
      path: AppRoutesName.mainEntry,
      name: AppRoutesName.mainEntry,
      builder: (context, state) {
        return const MainEntryPage();
      },
    ),
    GoRoute(
      path: AppRoutesName.authors,
      name: AppRoutesName.authors,
      builder: (context, state) {
        return const AuthorsPage();
      },
    ),
    GoRoute(
      path: AppRoutesName.home,
      name: AppRoutesName.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: AppRoutesName.descriptionPage,
      name: AppRoutesName.descriptionPage,
      builder: (context, state) {
        Color color = state.extra as Color;
        return BookDescription(color: color,);
      },
    ),
  ],
);
