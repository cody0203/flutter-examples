import 'dart:ui';

import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryTextColor = Color(0xFF4F4F4F);
  static const Color subTextColor = Color(0xFFA4A4A4);
  static const FontWeight normalFontWeight = FontWeight.w400;
  static const FontWeight boldFontWeight = FontWeight.w500;

  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      dividerColor: const Color(0xFFE3E3E3),
      fontFamily: 'Avenir',
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 40,
          fontWeight: normalFontWeight,
          height: 1.375,
          color: primaryTextColor,
        ),
        headline2: TextStyle(
          fontSize: 20,
          fontWeight: normalFontWeight,
          height: 1.35,
          color: primaryTextColor,
        ),
        headline3: TextStyle(
          fontSize: 19,
          fontWeight: boldFontWeight,
          height: 1.37,
          color: primaryTextColor,
        ),
        headline4: TextStyle(
          fontSize: 15,
          fontWeight: boldFontWeight,
          height: 1.33,
          color: primaryTextColor,
        ),
        bodyText1: TextStyle(
          fontSize: 15,
          fontWeight: normalFontWeight,
          height: 1.33,
          color: primaryTextColor,
        ),
        bodyText2: TextStyle(
          fontSize: 15,
          fontWeight: normalFontWeight,
          height: 1.33,
          color: subTextColor,
        ),
      ),
    );
  }
}
