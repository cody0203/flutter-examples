import '../../core/enums/category.dart';
import '../entities/category.dart';

abstract class CategoriesRepository {
  Category getProductByCategory(
    CategoryEnum category,
  );
}
