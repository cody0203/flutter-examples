import 'package:equatable/equatable.dart';

import 'product.dart';

class Cart extends Equatable {
  const Cart({
    required this.product,
    required this.amount,
    required this.id,
  });

  final Product product;
  final double amount;
  final DateTime id;

  @override
  List<Object> get props => [
        product,
        amount,
        id,
      ];
}
