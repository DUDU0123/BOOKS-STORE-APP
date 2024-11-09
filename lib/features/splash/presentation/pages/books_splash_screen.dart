import 'package:books_app/core/components/app_logo.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BooksSplashScreen extends StatelessWidget {
  const BooksSplashScreen({super.key});

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
