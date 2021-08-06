import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/presentation/cubit/add_to_cart/add_to_cart_cubit.dart';
import 'package:mijia_store/src/presentation/cubit/carts/carts_cubit.dart';
import 'package:mijia_store/src/presentation/widgets/shared/toss_add_to_cart_item.dart';

import '../../presentation/cubit/routing/routing_cubit.dart';
import '../../presentation/screens/cart_screen.dart';
import '../../presentation/screens/profile_screen.dart';
import '../../presentation/widgets/shared/custom_bottom_navigation_bar.dart';
import 'pages/category_page.dart';
import 'pages/home_page.dart';

class TabBarRouterDelegate<T> extends RouterDelegate<T> with ChangeNotifier {
  @override
  Future<bool> popRoute() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutingCubit, RoutingState>(
      builder: (BuildContext ctx, RoutingState routingState) {
        final RoutingCubit routingCubit =
            BlocProvider.of<RoutingCubit>(context, listen: false);

        return Stack(
          children: [
            Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              bottomNavigationBar: Container(
                padding: const EdgeInsets.only(
                  bottom: 23,
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context).accentColor.withOpacity(0.1),
                      blurRadius: 200,
                      spreadRadius: 150,
                    ),
                  ],
                ),
                child: CustomBottomNavigationBar(
                  selectedFontSize: 0,
                  elevation: 0,
                  containerPadding: const EdgeInsets.symmetric(vertical: 30),
                  containerBorderRadius: BorderRadius.circular(80),
                  selectedItemColor: Theme.of(context).primaryColor,
                  unselectedItemColor: const Color(0xffDADCE0),
                  iconSize: 30,
                  currentIndex: routingState.currentTabIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (int index) {
                    if (index < 2) {
                      routingCubit.onChangeTab(index);
                      return;
                    }

                    String routeName = CartScreen.routeName;
                    switch (index) {
                      case 2:
                        routeName = CartScreen.routeName;
                        break;
                      case 3:
                        routeName = ProfileScreen.routeName;
                        break;
                    }
                    routingCubit.onChangeRoute(
                      currentRoute: routeName,
                    );
                  },
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.grid_view_rounded),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      label: '',
                    ),
                  ],
                ),
              ),
              body: SafeArea(
                child: Navigator(
                  observers: <NavigatorObserver>[HeroController()],
                  pages: <Page<dynamic>>[
                    _buildTabView(routingState.currentTabIndex),
                  ],
                  onPopPage: (Route<dynamic> route, dynamic result) {
                    return true;
                  },
                ),
              ),
            ),
            BlocBuilder<AddToCartCubit, AddToCartState>(
              builder: (_, AddToCartState state) {
                return TossAddToCartItem(
                  imageAsset: state.imageAsset,
                  isRunning: state.isAdding,
                  dx: state.dx,
                  dy: state.dy,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(dynamic configuration) async => null;

  Page _buildTabView(int? tabIndex) {
    switch (tabIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const CategoryPage();
      default:
        return const MaterialPage<dynamic>(
          child: SizedBox(),
        );
    }
  }
}
