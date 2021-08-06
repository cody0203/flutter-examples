import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';
import '../shared/scale_up_product_item.dart';

class TopProductsListView extends StatefulWidget {
  const TopProductsListView({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<Product> products;

  @override
  _TopProductsListViewState createState() => _TopProductsListViewState();
}

class _TopProductsListViewState extends State<TopProductsListView> {
  late List<GlobalObjectKey> _itemKeys;
  int atFirstEdgeProduct = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _itemKeys = List.generate(
      widget.products.length,
      (int index) => GlobalObjectKey('${widget.products[index].name}$index'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 193,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          int index = (scrollNotification.metrics.pixels / 160).round();
          if (index < 0) {
            index = 0;
          }
          setState(() {
            atFirstEdgeProduct = index;
          });
          return true;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: <Widget>[
              for (int i = 0; i < widget.products.length; i++)
                ScaleAnimatedVerticalProductItem(
                  product: widget.products[i],
                  key: _itemKeys[i],
                  isAtFirstEdge: atFirstEdgeProduct == i,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
