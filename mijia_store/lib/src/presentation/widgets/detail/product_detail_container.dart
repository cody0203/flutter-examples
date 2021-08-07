import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector.dart';
import '../../../data/datasource/local/categories.dart';
import '../../../domain/entities/product.dart';
import '../../cubit/products/products_cubit.dart';
import 'product_detail.dart';

class DetailContainer extends StatelessWidget {
  DetailContainer({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  final Categories categories = Categories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.05,
        right: 23,
        bottom: MediaQuery.of(context).size.width * 0.04,
        left: 23,
      ),
      width: double.infinity,
      child: ProductDetail(product: product),
    );
  }
}
