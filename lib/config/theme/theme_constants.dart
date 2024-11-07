import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

const androidTransitionBuilder = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  },
);

const iosTransitionBuilder = PageTransitionsTheme(
  builders: {
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  },
);

class ThemeConstants {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      surfaceTintColor: kWhite,
      backgroundColor: kWhite,elevation: 0
    ),
    brightness: Brightness.light,
    pageTransitionsTheme: androidTransitionBuilder,
    scaffoldBackgroundColor: kWhite,
    dividerColor: kGrey.withOpacity(0.5),
    primaryColor: kWhite,
    colorScheme: ColorScheme.fromSeed(
      seedColor: kOrange,
      onPrimary: kBlack.withOpacity(0.7),
      brightness: Brightness.light,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      surfaceTintColor: kBlack,
      backgroundColor: kBlack,elevation: 0
    ),
    brightness: Brightness.dark,
    pageTransitionsTheme: androidTransitionBuilder,
    scaffoldBackgroundColor: kBlack,
    dividerColor: kWhite.withOpacity(0.5),
    primaryColor: kBlack,
    colorScheme: ColorScheme.fromSeed(
      seedColor: kOrange,
      onPrimary: kGrey,
      brightness: Brightness.dark,
    ),
  );
}
