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
    required this.productId,
  }) : super(key: key);
  final int productId;
  final Categories categories = Categories();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (BuildContext ctx) => injector()..getProduct(productId),
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
          right: 23,
          bottom: MediaQuery.of(context).size.width * 0.04,
          left: 23,
        ),
        width: double.infinity,
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (_, ProductsState state) {
            if (state is ProductsInit) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProductDone) {
              final Product product = state.product;
              return ProductDetail(product: product);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
