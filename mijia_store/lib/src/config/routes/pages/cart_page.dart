import 'package:flutter/material.dart';

import '../../../presentation/screens/cart_screen.dart';
import 'page_builder.dart';

class CartPage extends PageBuilder {
  const CartPage()
      : super(
          page: const CartScreen(),
          key: const ValueKey<String>('CartPage'),
        );
}
