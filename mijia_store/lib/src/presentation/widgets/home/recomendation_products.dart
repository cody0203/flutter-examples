import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/core/enums/category.dart';

import '../../../../injector.dart';
import '../../cubit/products/products_cubit.dart';
import '../shared/category_titles.dart';
import 'recomendation_products_list_view.dart';

class RecomendationProducts extends StatelessWidget {
  const RecomendationProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (_) =>
          injector()..getRecomendationCategory(CategoryEnum.recomendation),
      child: Container(
        padding: const EdgeInsets.only(top: 30, bottom: 35),
        child: Column(
          children: <Widget>[
            const CategoryTitles(title: 'Recomendation'),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (_, ProductsState state) {
                if (state is ProductsInit) {
                  return const CircularProgressIndicator();
                }
                if (state is RecomendationDone) {
                  return RecomendationProductsListView(
                    products: state.recomendationCategory.products,
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
