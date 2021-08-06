part of 'add_to_cart_cubit.dart';

class AddToCartState extends Equatable {
  const AddToCartState({
    required this.dx,
    required this.dy,
    required this.isAdding,
    required this.imageAsset,
  });

  final double dx;
  final double dy;
  final bool isAdding;
  final String imageAsset;

  List<Object> get props => <Object>[
        dx,
        dy,
        isAdding,
      ];
}

class AddToCartInit extends AddToCartState {
  const AddToCartInit()
      : super(
          dx: 0,
          dy: 0,
          isAdding: false,
          imageAsset: 'assets/images/placeholder.png',
        );

  List<Object> get props => <Object>[];
}

class AddedFromList extends AddToCartState {
  const AddedFromList({
    required double dx,
    required double dy,
    required bool isAdding,
    required String imageAsset,
  }) : super(
          dx: dx,
          dy: dy,
          isAdding: isAdding,
          imageAsset: imageAsset,
        );
}
