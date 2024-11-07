import 'package:books_app/config/routes/app_routes_name.dart';
import 'package:books_app/core/components/app_logo.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksSplashScreen extends StatefulWidget {
  const BooksSplashScreen({super.key});

  @override
  State<BooksSplashScreen> createState() => _BooksSplashScreenState();
}

class _BooksSplashScreenState extends State<BooksSplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        mounted ? context.goNamed(AppRoutesName.mainEntry) : null;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 171, 46),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kOrange.withOpacity(0.6),
              deepOrange,
            ],
          ),
        ),
        child: const Center(
          child: AppLogo(),
        ),
      ),
    );
  }
}
