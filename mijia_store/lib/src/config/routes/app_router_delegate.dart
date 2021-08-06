import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_to_background/move_to_background.dart';

import '../../presentation/cubit/routing/routing_cubit.dart';
import '../../presentation/screens/cart_screen.dart';
import '../../presentation/screens/detail_screen.dart';
import '../../presentation/screens/profile_screen.dart';
import '../../presentation/widgets/shared/main_tab_bar.dart';
import 'pages/cart_page.dart';
import 'pages/detail_page.dart';
import 'pages/profile_page.dart';

class AppRouterDelegate<T> extends RouterDelegate<T> with ChangeNotifier {
  @override
  Future<bool> popRoute() async {
    MoveToBackground.moveTaskToBack();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutingCubit, RoutingState>(
      builder: (BuildContext ctx, RoutingState state) {
        return Navigator(
          observers: <NavigatorObserver>[HeroController()],
          pages: <Page<dynamic>>[
            MaterialPage<dynamic>(
              key: const ValueKey<String>('AppBar'),
              child: MainTabBar(),
            ),
            if (state.overTabRouteName.isNotEmpty)
              _buildAppPage(
                state,
              ),
          ],
          onPopPage: (Route<dynamic> route, dynamic result) {
            if (!route.didPop(result)) return false;
            final RoutingCubit routingCubit = context.read<RoutingCubit>();
            final String? prevRouteName = routingCubit.state.prevRouteName;

            if (prevRouteName == DetailScreen.routeName) {
              routingCubit.onChangeRoute(
                currentRoute: prevRouteName!,
                productId: routingCubit.state.productId,
              );
            } else {
              routingCubit.onChangeTab(null);
            }

            return true;
          },
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(dynamic configuration) async => null;

  Page _buildAppPage(RoutingState state) {
    final String overTabRouteName = state.overTabRouteName;
    final int? productId = state.productId;
    switch (overTabRouteName) {
      case CartScreen.routeName:
        return const CartPage();
      case ProfileScreen.routeName:
        return const ProfilePage();
    }

    if (overTabRouteName == DetailScreen.routeName && productId != null) {
      return DetailPage(productId);
    }

    return const MaterialPage(
      child: SizedBox(),
    );
  }
}
