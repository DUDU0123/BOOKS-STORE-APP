import 'package:books_app/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:books_app/features/auth/presentation/pages/register/register_page.dart';
import 'package:books_app/features/main_nav/presentation/pages/main_entry_page.dart';
import 'package:books_app/features/splash/presentation/pages/books_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  final ValueNotifier<bool> _showSplashNotifier = ValueNotifier<bool>(true);
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _showSplashNotifier.value = false;
        context.read<AuthenticationBloc>().add(CheckUserLoggedInEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _showSplashNotifier,
        builder: (context, showSplash, child) {
          if (showSplash) {
            return const BooksSplashScreen();
          }
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationSuccessState) {
                if (state.isLoggedIn != null) {
                  if (state.isLoggedIn!) {
                    return const MainEntryPage();
                  } else {
                    return const RegisterPage();
                  }
                } else {
                  return const RegisterPage();
                }
              } else {
                return const RegisterPage();
              }
            },
          );
        });
  }
}
