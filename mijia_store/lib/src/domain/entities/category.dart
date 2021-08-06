import 'package:mijia_store/src/domain/entities/product.dart';

class Category {
  const Category({
    required this.title,
    required this.products,
    required this.icon,
  });

  final List<Product> products;
  final String title;
  final String icon;
}
