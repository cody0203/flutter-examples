import 'package:flutter/material.dart';

import '../widgets/cart/cart_container.dart';
import '../widgets/shared/main_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: MainAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: const CartContainer(),
    );
  }
}
