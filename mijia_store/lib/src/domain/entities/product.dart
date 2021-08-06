import 'package:equatable/equatable.dart';

import '../../core/enums/category.dart';

class Product extends Equatable {
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.weight,
    required this.pricePerKg,
    required this.imageAssets,
    required this.isFavorite,
  });
  final int id;
  final String name;
  final List<CategoryEnum> category;
  final int weight;
  final double pricePerKg;
  final List<String> imageAssets;
  final bool isFavorite;

  @override
  List<Object> get props => [
        id,
        name,
        category,
        weight,
        pricePerKg,
        imageAssets,
        isFavorite,
      ];
}
