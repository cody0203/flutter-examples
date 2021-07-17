import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/themes/app_themes.dart';
import 'vnse_landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vnse Landing Page',
      theme: AppTheme().light,
      home: VnseLandingPage(),
    );
  }
}
