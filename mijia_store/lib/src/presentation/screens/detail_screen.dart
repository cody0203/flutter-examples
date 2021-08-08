import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/injector.dart';
import 'package:mijia_store/src/domain/entities/product.dart';
import 'package:mijia_store/src/presentation/cubit/products/products_cubit.dart';
import 'package:mijia_store/src/presentation/widgets/detail/favorite_icon.dart';

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
    return BlocProvider<ProductsCubit>(
      create: (BuildContext ctx) => injector()..getProduct(productId),
      child: Scaffold(
        appBar: const MainAppBar(
          actions: <Widget>[
            FavoriteIcon(),
          ],
        ),
        body: DetailContainer(
          productId: productId,
        ),
      ),
      // child: BlocBuilder<ProductsCubit, ProductsState>(
      //   builder: (_, ProductsState state) {
      //     if (state is ProductsInit) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     print(state);
      //     if (state is ProductDone) {
      //       final Product product = state.product;
      //       return Scaffold(
      //         appBar: MainAppBar(
      //           actions: <Widget>[
      //             FavoriteIcon(
      //               product: product,
      //             ),
      //           ],
      //         ),
      //         body: DetailContainer(
      //           product: product,
      //         ),
      //       );
      //     }

      //     return const SizedBox();
      //   },
      // ),
    );
  }
}
