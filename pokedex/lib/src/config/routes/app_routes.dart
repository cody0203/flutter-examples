import 'package:flutter/material.dart';
import 'package:pokedex/src/config/routes/app_tab_routes.dart';
import 'package:pokedex/src/features/pokemon/presentation/screens/detail/pokemon_detail_screen.dart';

import '../../features/pokemon/presentation/screens/list/pokemon_list_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return _materialRoute(const PokemonListScreen(), settings);
    }
  }

  static Route<dynamic> _materialRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute<MaterialPageRoute<dynamic>>(
      settings: settings,
      builder: (_) => widget,
    );
  }
}
