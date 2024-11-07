import 'package:books_app/features/splash/presentation/pages/books_splash_screen.dart';
import 'package:flutter/material.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BooksSplashScreen() ,
    );
  }
}