import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mijia_store/src/domain/usecase/update_product_usecase.dart';

import '../../../core/enums/category.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecase/get_category_products_usecase.dart';
import '../../../domain/usecase/get_product_usecase.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this._categoryProductsUseCase,
    this._getProductUsecase,
    this._updateProductUsecase,
  ) : super(const ProductsInit());

  final GetCategoryProductsUseCase _categoryProductsUseCase;
  final GetProductUsecase _getProductUsecase;
  final UpdateProductUsecase _updateProductUsecase;

  Future<void> getTopProductsCategory(CategoryEnum category) async {
    try {
      final Category topProductsCategory =
          _categoryProductsUseCase(category: category);
      emit(
        TopProductsCategoryDone(topProductsCategory: topProductsCategory),
      );
    } on Exception {
      print('getTopProductsCategory error');
    }
  }

  Future<void> getRecomendationCategory(CategoryEnum category) async {
    try {
      final Category recomendationCategory =
          _categoryProductsUseCase(category: category);
      emit(
        RecomendationDone(recomendationCategory: recomendationCategory),
      );
    } on Exception {
      print('getRecomendationCategory error');
    }
  }

  Future<void> getVegetablesCategory(CategoryEnum category) async {
    try {
      final Category vegetablesCategory =
          _categoryProductsUseCase(category: category);
      emit(
        VegetableCategoryDone(vegetablesCategory: vegetablesCategory),
      );
    } on Exception {
      print('getVegetablesCategory error');
    }
  }

  Future<void> getFruitCategory(CategoryEnum category) async {
    try {
      final Category fruitCategory =
          _categoryProductsUseCase(category: category);
      emit(
        FruitCategoryDone(fruitCategory: fruitCategory),
      );
    } on Exception {
      print('getFruitCategory error');
    }
  }

  Future<void> getProduct(int productId) async {
    try {
      final Product product = _getProductUsecase(productId);
      emit(ProductDone(product: product));
    } on Exception {
      print('getProduct error');
    }
  }

  Future<void> updateProduct(Product newProduct) async {
    try {
      final Product updatedProduct = Product(
        id: newProduct.id,
        name: newProduct.name,
        category: newProduct.category,
        weight: newProduct.weight,
        pricePerKg: newProduct.pricePerKg,
        imageAssets: newProduct.imageAssets,
        isFavorite: !newProduct.isFavorite,
      );
      final Product product = _updateProductUsecase(updatedProduct);

      emit(ProductDone(product: product));
    } on Exception {
      print('getProduct error');
    }
  }
}
