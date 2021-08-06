import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/core/enums/category.dart';
import 'package:mijia_store/src/presentation/cubit/products/products_cubit.dart';

import '../../../../injector.dart';

import '../shared/category_titles.dart';
import 'top_products_list_view.dart';

class TopProducts extends StatelessWidget {
  const TopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (_) =>
          injector()..getTopProductsCategory(CategoryEnum.topProducts),
      child: Container(
        padding: const EdgeInsets.only(top: 14, bottom: 16),
        child: Column(
          children: <Widget>[
            const CategoryTitles(title: 'Top Products'),
            BlocBuilder<ProductsCubit, ProductsState>(
              buildWhen: (ProductsState prevState, ProductsState state) =>
                  state is TopProductsCategoryDone,
              builder: (_, ProductsState state) {
                if (state is ProductsInit) {
                  return const CircularProgressIndicator();
                }

                if (state is TopProductsCategoryDone) {
                  return TopProductsListView(
                    products: state.topProductsCategory.products,
                  );
                }

                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
