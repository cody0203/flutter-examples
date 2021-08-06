import '../entities/product.dart';

abstract class ProductRepository {
  Product getProduct(int id);
}
