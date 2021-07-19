import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Course Demo',
      theme: AppTheme().light,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
