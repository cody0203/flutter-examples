import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/core/enums/category.dart';
import 'package:mijia_store/src/presentation/cubit/products/products_cubit.dart';

import '../../../../injector.dart';

import '../shared/category_titles.dart';
import 'product_grid_view.dart';

class VegetableProducts extends StatelessWidget {
  const VegetableProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (_) => injector()..getVegetablesCategory(CategoryEnum.vegetables),
      child: Container(
        padding: const EdgeInsets.only(top: 14, bottom: 16),
        child: Column(
          children: <Widget>[
            const CategoryTitles(title: 'Vegetables'),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (_, ProductsState state) {
                if (state is ProductsInit) {
                  return const CircularProgressIndicator();
                }
                if (state is VegetableCategoryDone) {
                  return ProductGridView(
                    products: state.vegetablesCategory.products,
                    childRatio: 1.3,
                    height: 365,
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
