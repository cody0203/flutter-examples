import 'package:flutter/material.dart';
import 'package:mijia_store/src/presentation/widgets/shared/horizotal_product_item.dart';

import '../../../domain/entities/product.dart';

class RecomendationProductsListView extends StatefulWidget {
  const RecomendationProductsListView({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<Product> products;

  @override
  _RecomendationProductsListViewState createState() =>
      _RecomendationProductsListViewState();
}

class _RecomendationProductsListViewState
    extends State<RecomendationProductsListView> {
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
      height: 84,
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
                HorizontalProductItem(product: widget.products[i]),
            ],
          ),
        ),
      ),
    );
  }
}
