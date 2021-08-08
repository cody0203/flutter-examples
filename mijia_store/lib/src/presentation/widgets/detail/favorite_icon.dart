import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/domain/entities/product.dart';
import 'package:mijia_store/src/presentation/cubit/products/products_cubit.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (_, ProductsState state) {
          if (state is ProductDone) {
            final Product product = state.product;
            return IconButton(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.5,
                vertical: 6.5,
              ),
              onPressed: () {
                BlocProvider.of<ProductsCubit>(context).updateProduct(
                  product,
                );
              },
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_outline,
                size: 27,
                color: product.isFavorite ? Colors.red : Colors.black,
              ),
            );
          }

          return IconButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.5,
              vertical: 6.5,
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
              size: 27,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
