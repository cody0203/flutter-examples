import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/core/helpers/add_to_cart_func.dart';

import '../../../domain/entities/product.dart';
import '../../cubit/routing/routing_cubit.dart';
import '../../screens/detail_screen.dart';
import 'main_button.dart';
import 'product_layer_blur.dart';
import 'product_price.dart';
import 'product_weight.dart';

class HorizontalProductItem extends StatelessWidget {
  const HorizontalProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<RoutingCubit>(
          context,
          listen: false,
        ).onChangeRoute(
          currentRoute: DetailScreen.routeName,
          productId: product.id,
        );
      },
      child: Stack(
        children: <Widget>[
          const ProductLayerBlur(width: 159),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 84,
              maxWidth: 210,
            ),
            margin: const EdgeInsets.only(right: 26),
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
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
            child: Row(
              children: <Widget>[
                Image.asset(
                  product.imageAssets[0],
                  width: 69,
                  height: 62,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 12,
                                    height: 1.83,
                                  ),
                            ),
                            ProductWeight(weight: product.weight),
                            ProductPricePerKg(pricePerKg: product.pricePerKg),
                          ],
                        ),
                        MainButton(
                          height: 28,
                          width: 28,
                          onPressed: () {
                            final RenderBox box =
                                context.findRenderObject() as RenderBox;
                            final Offset position =
                                box.localToGlobal(Offset.zero);
                            final double dx = position.dx + (210 / 2);
                            final double dy = position.dy + (84 / 2);

                            addToCartHelper(
                              context: context,
                              product: product,
                              amount: 1,
                              dx: dx,
                              dy: dy,
                              imageAsset: product.imageAssets[0],
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            size: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
