import 'package:flutter/material.dart';

import '../widgets/detail/product_detail_container.dart';
import '../widgets/shared/main_app_bar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.productId,
  }) : super(key: key);
  static const String routeName = '/detail';
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: IconButton(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.5,
                vertical: 6.5,
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                size: 27,
              ),
            ),
          ),
        ],
      ),
      body: DetailContainer(
        productId: productId,
      ),
    );
  }
}
