import 'package:flutter/material.dart';

import '../../presentations/views/login_screen.dart';
import '../../presentations/views/notification_screen.dart';
import 'app_tabs.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(LoginScreen(), settings);
      case NotificationScreen.routeName:
        return _materialRoute(NotificationScreen(), settings);
      default:
        return _materialRoute(AppTabs(), settings);
    }
  }

  static Route<dynamic> _materialRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => widget,
    );
  }
}
