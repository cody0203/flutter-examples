import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 1,
        brightness: Brightness.light,
        backgroundColor: Color(0xffF2F2F2),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.black,
          fontFamily: 'Montserrat',
          fontSize: 34,
          letterSpacing: -1,
        ),
        headline2: TextStyle(
          color: Colors.black,
          fontFamily: 'Montserrat',
          fontSize: 24,
          height: 1.33,
          letterSpacing: -1,
        ),
        headline3: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        headline4: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        headline6: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        bodyText1: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 1.375,
        ),
        bodyText2: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.7),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w300,
          fontSize: 14,
          height: 1.21,
        ),
      ),
      scaffoldBackgroundColor: Color(0xffF7F7F7),
      splashColor: Colors.transparent,
      errorColor: Color(0xffF44337),
      primaryColor: Color(0xff00BCD4),
      primaryColorLight: Color(0xff8FDFEC),
      accentColor: Color(0xffFDFFE6),
    );
  }
}
