import '../entities/product.dart';
import '../repositories/product_repository.dart';

class UpdateProductUsecase {
  const UpdateProductUsecase(this._productRepository);
  final ProductRepository _productRepository;
  Product call(Product newProduct) {
    return _productRepository.updateProduct(newProduct);
  }
}
