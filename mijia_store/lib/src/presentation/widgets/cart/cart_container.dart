import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/carts/carts_cubit.dart';
import '../shared/main_button.dart';
import 'cart_list_item.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 23,
        bottom: MediaQuery.of(context).size.height < 780
            ? MediaQuery.of(context).size.width * 0.02
            : MediaQuery.of(context).size.width * 0.04,
        left: 23,
      ),
      child: BlocBuilder<CartsCubit, CartsState>(
        builder: (_, CartsState state) {
          if (state.cart.isEmpty) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(65),
                    ),
                    child: const Icon(
                      Icons.production_quantity_limits,
                      color: Colors.white,
                      size: 55,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Your cart is empty',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CartListItem(cart: state.cart),
              MainButton(
                height: MediaQuery.of(context).size.height < 780
                    ? MediaQuery.of(context).size.width * 0.13
                    : MediaQuery.of(context).size.width * 0.14,
                width: double.infinity,
                onPressed: () {},
                child: Text(
                  'Checkout',
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: Colors.white,
                        letterSpacing: -1,
                      ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
