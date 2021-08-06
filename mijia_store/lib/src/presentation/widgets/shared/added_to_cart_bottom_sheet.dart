import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/presentation/cubit/carts/carts_cubit.dart';
import 'package:mijia_store/src/presentation/cubit/routing/routing_cubit.dart';
import 'package:mijia_store/src/presentation/screens/cart_screen.dart';

import 'main_button.dart';
import 'product_price.dart';

class AddedToCartBottomSheet extends StatelessWidget {
  const AddedToCartBottomSheet({
    Key? key,
    required this.name,
    required this.imageAsset,
    required this.amount,
    required this.pricePerKg,
    this.currentRoute,
    this.productId,
  }) : super(key: key);
  final int amount;
  final String name;
  final double pricePerKg;
  final String imageAsset;
  final String? currentRoute;
  final int? productId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxHeight: 300,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 26,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.check_circle_outline,
                        size: 16,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'This item has been added to cart',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              height: 1,
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.close,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: <Widget>[
                  Image.asset(
                    imageAsset,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(width: 28),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      ProductPricePerKg(
                        pricePerKg: pricePerKg,
                        kgLabelFontSize: 14,
                        priceFontSize: 16,
                      ),
                      Text(
                        'Amount: $amount kg',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontSize: 13,
                            ),
                      ),
                      Text(
                        '\$${(amount * pricePerKg).toInt()}',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          MainButton(
            height: 50,
            width: double.infinity,
            onPressed: () {
              BlocProvider.of<RoutingCubit>(context).onChangeRoute(
                currentRoute: CartScreen.routeName,
                prevRouteName: currentRoute,
                productId: productId,
              );
            },
            child: const Text('Go to cart'),
          ),
        ],
      ),
    );
  }
}
