import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      unselectedWidgetColor: Color(0xffDDDDDD),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Colors.black,
            height: 1.21,
            letterSpacing: 2,
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xffD3D3D3),
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          fontSize: 34,
          color: Colors.black,
          height: 1.176,
        ),
        headline2: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Colors.black,
          height: 1.21,
        ),
        headline3: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.black,
          height: 1.1875,
        ),
        headline4: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: Color(0xffB7B7B7),
          height: 1.21,
        ),
        bodyText1: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Color(0xff121212),
          height: 1.4285,
        ),
        bodyText2: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 13,
          color: Color(0xffBDBDBD),
          height: 1.21,
        ),
      ),
      primaryColor: Color(0xff1F88C1),
      buttonTheme: ButtonThemeData(
        padding: const EdgeInsets.symmetric(
          vertical: 23,
        ),
      ),
    );
  }
}
