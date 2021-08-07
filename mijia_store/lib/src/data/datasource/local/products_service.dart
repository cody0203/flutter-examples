import '../../../core/enums/category.dart';
import '../../../domain/entities/product.dart';

List<Product> _products = [
  Product(
    id: 1,
    name: 'Broccoli',
    category: const <CategoryEnum>[
      CategoryEnum.vegetables,
      CategoryEnum.topProducts,
    ],
    weight: 100,
    pricePerKg: 4,
    imageAssets: const <String>[
      'assets/images/broccoli_1.png',
      'assets/images/broccoli_2.png',
      'assets/images/broccoli_3.png',
      'assets/images/broccoli_4.png',
    ],
    isFavorite: false,
  ),
  Product(
    id: 2,
    name: 'Avocado',
    category: const <CategoryEnum>[
      CategoryEnum.fruit,
      CategoryEnum.recomendation,
    ],
    weight: 220,
    pricePerKg: 9,
    imageAssets: const <String>[
      'assets/images/avocado_1.png',
    ],
    isFavorite: false,
  ),
  Product(
    id: 3,
    name: 'Orange',
    category: const <CategoryEnum>[
      CategoryEnum.fruit,
      CategoryEnum.recomendation,
    ],
    weight: 160,
    pricePerKg: 4,
    imageAssets: const <String>[
      'assets/images/orange_1.png',
    ],
    isFavorite: false,
  ),
  Product(
    id: 4,
    name: 'Gedang',
    category: const <CategoryEnum>[
      CategoryEnum.fruit,
      CategoryEnum.topProducts,
    ],
    weight: 100,
    pricePerKg: 10,
    imageAssets: const <String>[
      'assets/images/gedang_1.png',
    ],
    isFavorite: false,
  ),
  Product(
    id: 5,
    name: 'Tomatoes',
    category: const <CategoryEnum>[
      CategoryEnum.vegetables,
      CategoryEnum.topProducts,
    ],
    weight: 10,
    pricePerKg: 8,
    imageAssets: const <String>[
      'assets/images/tomato_1.png',
    ],
    isFavorite: false,
  ),
  Product(
    id: 6,
    name: 'Pepper',
    category: const <CategoryEnum>[
      CategoryEnum.vegetables,
      CategoryEnum.topProducts,
    ],
    weight: 100,
    pricePerKg: 10,
    imageAssets: const <String>[
      'assets/images/pepper_1.png',
    ],
    isFavorite: false,
  ),
  Product(
    id: 7,
    name: 'Carrot',
    category: const <CategoryEnum>[CategoryEnum.vegetables],
    weight: 30,
    pricePerKg: 13,
    imageAssets: const <String>[
      'assets/images/carrot_1.png',
    ],
    isFavorite: false,
  ),
  Product(
    id: 8,
    name: 'Radish',
    category: const <CategoryEnum>[CategoryEnum.vegetables],
    weight: 80,
    pricePerKg: 8,
    imageAssets: const <String>[
      'assets/images/radish_1.png',
    ],
    isFavorite: false,
  ),
  Product(
    id: 9,
    name: 'Corn',
    category: const <CategoryEnum>[
      CategoryEnum.vegetables,
      CategoryEnum.recomendation,
    ],
    weight: 100,
    pricePerKg: 16,
    imageAssets: const <String>[
      'assets/images/corn_1.png',
    ],
    isFavorite: false,
  ),
];

class ProductsService {
  List<Product> getProducts(CategoryEnum category) {
    return _products
        .where(
          (Product product) => product.category.contains(category),
        )
        .toList();
  }

  Product getProduct(int id) {
    return _products.firstWhere((Product product) => product.id == id);
  }

  Product updateProduct(Product newProduct) {
    final int productIndex = _products.indexWhere(
      (Product product) => product.id == newProduct.id,
    );
    _products[productIndex] = newProduct;
    return _products[productIndex];
  }
}
