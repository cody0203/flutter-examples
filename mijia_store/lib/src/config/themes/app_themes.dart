import 'package:flutter/material.dart';

const TextStyle rootTextStyle = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 28,
  height: 1.18,
);

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFFCFEFF),
      primaryColor: const Color(0xFFFF844C),
      accentColor: const Color(0xFF2A6049),
      hintColor: const Color(0xFF3D3D3D),
      shadowColor: const Color(0xFFF1F4F9),
      buttonColor: const Color(0xFFFF844C),
      splashColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: rootTextStyle.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          height: 1.1,
        ),
      ),
      textTheme: TextTheme(
        headline1: rootTextStyle,
        headline2: rootTextStyle.copyWith(
          fontSize: 24,
          height: 1.33,
        ),
        headline3: rootTextStyle.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.22,
        ),
        headline4: rootTextStyle.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 1.17,
        ),
        bodyText1: rootTextStyle.copyWith(
          fontSize: 16,
          height: 1.375,
        ),
        bodyText2: rootTextStyle.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          height: 2.2,
        ),
      ),
    );
  }
}
