import 'package:flutter/material.dart';
import 'package:pokedex/src/config/routes/app_routes.dart';
import 'package:pokedex/src/config/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex',
      theme: AppThemes.light,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
