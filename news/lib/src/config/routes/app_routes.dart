import 'package:flutter/material.dart';

import '../../presentation/views/top_headlines_view.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return _materialRoute(TopHeadlinesView());
    }
  }

  static Route<dynamic> _materialRoute(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
