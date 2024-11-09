import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(color: kBlack.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(15),
        color: kWhite,
      ),
      child: Center(
        child: Image.asset('assets/BookLogo.png'),
        // Icon(
        //   Icons.book,
        //   color: kOrange,
        //   size: 38,
        // ),
      ),
    );
  }
}
