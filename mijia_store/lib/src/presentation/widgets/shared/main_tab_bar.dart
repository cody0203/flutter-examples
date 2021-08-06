import 'package:flutter/material.dart';

import '../../../config/routes/tab_bar_router_delegate.dart';

class MainTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Router<dynamic>(
      routerDelegate: TabBarRouterDelegate<dynamic>(),
    );
  }
}
