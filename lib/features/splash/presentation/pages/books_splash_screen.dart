import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BooksSplashScreen extends StatelessWidget {
  const BooksSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kOrange,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kWhite,
          ),
          child: const Center(child: Icon(Icons.book),),
        ),
      ),
    );
  }
}