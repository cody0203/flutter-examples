import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductUsecase {
  GetProductUsecase(this._productRepository);
  final ProductRepository _productRepository;

  Product call(int id) {
    return _productRepository.getProduct(id);
  }
}
