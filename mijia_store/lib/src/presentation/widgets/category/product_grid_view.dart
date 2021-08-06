import 'package:flutter/material.dart';
import 'package:mijia_store/src/presentation/widgets/shared/vertical_product_item.dart';

import '../../../domain/entities/product.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key? key,
    required this.products,
    this.maxAxisCount = 2,
    required this.childRatio,
    required this.height,
  }) : super(key: key);
  final List<Product> products;
  final int maxAxisCount;
  final double childRatio;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GridView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: maxAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: childRatio,
        ),
        itemCount: products.length,
        itemBuilder: (_, int index) {
          return VerticalProductItem(
            product: products[index],
            rightSpacing: 0,
          );
        },
      ),
    );
  }
}
