import '../../core/enums/category.dart';
import '../entities/category.dart';
import '../repositories/categories_repository.dart';

class GetCategoryProductsUseCase {
  const GetCategoryProductsUseCase(this._categoriesRepository);
  final CategoriesRepository _categoriesRepository;

  Category call({
    required CategoryEnum category,
  }) {
    return _categoriesRepository.getProductByCategory(category);
  }
}
