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

class VerticalProductItem extends StatelessWidget {
  const VerticalProductItem({
    Key? key,
    required this.product,
    this.height = 180,
    this.width = 130,
    this.rightSpacing = 30,
  }) : super(key: key);
  final Product product;
  final double? width;
  final double? height;
  final double rightSpacing;

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
        children: [
          const ProductLayerBlur(width: 130),
          Container(
            padding: const EdgeInsets.only(
              left: 18,
              right: 6,
              bottom: 6,
            ),
            margin: EdgeInsets.only(
              right: rightSpacing,
            ),
            width: width,
            height: height,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  product.imageAssets[0],
                  width: 93,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.name,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
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
                        final Offset position = box.localToGlobal(Offset.zero);
                        final double dx = position.dx + (width! / 2);
                        final double dy = position.dy + (height! / 2);

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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
