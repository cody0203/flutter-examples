part of 'products_cubit.dart';

abstract class ProductsState {
  const ProductsState();
}

class ProductsInit extends ProductsState {
  const ProductsInit();
}

class TopProductsCategoryDone extends ProductsState {
  const TopProductsCategoryDone({
    required this.topProductsCategory,
  });
  final Category topProductsCategory;

  @override
  List<Object> get props => <Object>[topProductsCategory];
}

class RecomendationDone extends ProductsState {
  const RecomendationDone({
    required this.recomendationCategory,
  });
  final Category recomendationCategory;

  @override
  List<Object> get props => <Object>[recomendationCategory];
}

class VegetableCategoryDone extends ProductsState {
  const VegetableCategoryDone({
    required this.vegetablesCategory,
  });
  final Category vegetablesCategory;

  @override
  List<Object> get props => <Object>[vegetablesCategory];
}

class FruitCategoryDone extends ProductsState {
  const FruitCategoryDone({
    required this.fruitCategory,
  });
  final Category fruitCategory;

  @override
  List<Object> get props => <Object>[fruitCategory];
}

class ProductDone extends ProductsState {
  const ProductDone({
    required this.product,
  });
  final Product product;

  @override
  List<Object> get props => <Object>[product];
}
