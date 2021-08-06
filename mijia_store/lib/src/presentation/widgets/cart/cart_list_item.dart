import 'package:flutter/material.dart';
import 'package:mijia_store/src/domain/entities/cart.dart';
import 'package:mijia_store/src/presentation/widgets/cart/cart_item.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    Key? key,
    required this.cart,
  }) : super(key: key);
  final List<Cart> cart;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height < 700
                ? MediaQuery.of(context).size.height * 0.21
                : MediaQuery.of(context).size.height * 0.22),
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (_, int index) {
            return CartItem(
              product: cart[index].product,
              amount: cart[index].amount,
              cartId: cart[index].id,
              key: ValueKey<DateTime>(cart[index].id),
            );
          },
        ),
      ),
    );
  }
}
