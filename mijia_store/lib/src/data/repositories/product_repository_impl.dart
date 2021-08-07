import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasource/local/products_service.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl(this._productsService);
  final ProductsService _productsService;

  @override
  Product getProduct(int id) {
    return _productsService.getProduct(id);
  }

  @override
  Product updateProduct(Product newProduct) {
    return _productsService.updateProduct(newProduct);
  }
}
