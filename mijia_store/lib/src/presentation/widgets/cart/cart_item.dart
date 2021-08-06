import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/domain/entities/product.dart';
import 'package:mijia_store/src/presentation/cubit/carts/carts_cubit.dart';
import 'package:mijia_store/src/presentation/widgets/shared/main_button.dart';
import 'package:mijia_store/src/presentation/widgets/shared/product_layer_blur.dart';
import 'package:mijia_store/src/presentation/widgets/shared/product_price.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.product,
    required this.amount,
    required this.cartId,
  }) : super(key: key);
  final Product product;
  final double amount;
  final DateTime cartId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ProductLayerBlur(width: 130),
        Container(
          padding: const EdgeInsets.only(
            top: 12,
            right: 14,
            bottom: 12,
            left: 8,
          ),
          margin: const EdgeInsets.only(bottom: 31),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(0.0, 8.0),
                blurRadius: 10,
                color: Theme.of(context).shadowColor,
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset(
                        product.imageAssets[0],
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                      ProductPricePerKg(
                        pricePerKg: product.pricePerKg,
                        priceFontSize: 10,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontSize: 10,
                                    height: 2.2,
                                  ),
                          children: <InlineSpan>[
                            const TextSpan(
                              text: 'Total is ',
                            ),
                            TextSpan(
                              text: '\$${amount.toInt()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontSize: 10,
                                    height: 2.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const TextSpan(
                              text: ' by weight',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<CartsCubit>(context, listen: false)
                        .removeCartItem(cartId);
                  },
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
              ),
              Positioned(
                bottom: 3,
                right: 0,
                child: MainButton(
                  height: 28,
                  width: 86,
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: const Color(0xFFF8F9FD),
                          fontSize: 12,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
