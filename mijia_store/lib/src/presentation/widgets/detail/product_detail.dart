import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/core/helpers/add_to_cart_func.dart';
import 'package:mijia_store/src/domain/entities/cart.dart';
import 'package:mijia_store/src/presentation/cubit/carts/carts_cubit.dart';
import 'package:mijia_store/src/presentation/screens/detail_screen.dart';
import 'package:mijia_store/src/presentation/widgets/shared/added_to_cart_bottom_sheet.dart';

import '../../../data/datasource/local/categories.dart';
import '../../../domain/entities/product.dart';
import '../shared/main_button.dart';
import '../shared/product_price.dart';
import 'product_showcases.dart';
import 'quantity_controller.dart';
import 'represent_image.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final Categories categories = Categories();
  int representImageIndex = 0;
  int prevImageIndex = 0;
  int _amount = 1;

  void changeRepresentImage(int index) {
    setState(() {
      prevImageIndex = representImageIndex;
      representImageIndex = index;
    });
  }

  void changeAmount(int newAmount) {
    if (newAmount < 1 || newAmount > 99) return;
    setState(() {
      _amount = newAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              widget.product.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 11),
            Text(
              categories.mappingCategory[widget.product.category[0]]?['name'] ??
                  '',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: const Color(0xFF606368),
                  ),
            ),
            RepresentImage(
              imageAsset: widget.product.imageAssets[representImageIndex],
              prevIndex: prevImageIndex,
              currentIndex: representImageIndex,
            ),
            ProductPricePerKg(
              pricePerKg: widget.product.pricePerKg,
              priceFontSize: MediaQuery.of(context).size.width * 0.05,
              kgLabelFontSize: MediaQuery.of(context).size.width * 0.04,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height < 780
                    ? MediaQuery.of(context).size.width * 0.04
                    : MediaQuery.of(context).size.width * 0.05),
            QuantityController(
              amount: _amount,
              changeAmount: changeAmount,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height < 780
                    ? MediaQuery.of(context).size.width * 0.04
                    : MediaQuery.of(context).size.width * 0.05),
          ],
        ),
        Column(
          children: <Widget>[
            ProductShowcases(
              imageAssets: widget.product.imageAssets,
              changeRepresentImage: changeRepresentImage,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height < 780
                    ? MediaQuery.of(context).size.width * 0.04
                    : MediaQuery.of(context).size.width * 0.09),
            MainButton(
              height: MediaQuery.of(context).size.height < 780
                  ? MediaQuery.of(context).size.width * 0.13
                  : MediaQuery.of(context).size.width * 0.14,
              width: double.infinity,
              onPressed: () {
                addToCartHelper(
                  context: context,
                  product: widget.product,
                  amount: _amount,
                  isShowBottomSheet: true,
                );
              },
              child: Text(
                'Add to cart',
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: Colors.white,
                      letterSpacing: -1,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
