import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector.dart';
import '../../../core/enums/category.dart';
import '../../cubit/products/products_cubit.dart';
import '../shared/category_titles.dart';
import 'product_grid_view.dart';

class FruitProducts extends StatelessWidget {
  const FruitProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (_) => injector()..getFruitCategory(CategoryEnum.fruit),
      child: Container(
        padding: const EdgeInsets.only(top: 14, bottom: 16),
        child: Column(
          children: <Widget>[
            const CategoryTitles(title: 'Fruit'),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (_, ProductsState state) {
                if (state is ProductsInit) {
                  return const CircularProgressIndicator();
                }
                if (state is FruitCategoryDone) {
                  return ProductGridView(
                    products: state.fruitCategory.products,
                    maxAxisCount: 1,
                    childRatio: 1.5,
                    height: 200,
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
