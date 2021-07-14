import 'dart:io';

import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 1,
        brightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
        backgroundColor: Platform.isAndroid ? Colors.amber : Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      accentColor: Colors.black,
      splashColor: Colors.transparent,
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        headline1: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
