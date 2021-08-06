import 'package:mijia_store/src/core/enums/category.dart';
import 'package:mijia_store/src/data/datasource/local/categories.dart';
import 'package:mijia_store/src/data/datasource/local/products_service.dart';

import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  const CategoriesRepositoryImpl(
    this._productsService,
    this._categories,
  );
  final ProductsService _productsService;
  final Categories _categories;

  @override
  Category getProductByCategory(CategoryEnum category) {
    return Category(
      title: _categories.mappingCategory[category]?['name'] ?? '',
      products: _productsService.getProducts(category),
      icon: _categories.mappingCategory[category]?['icon'] ?? '',
    );
  }
}
