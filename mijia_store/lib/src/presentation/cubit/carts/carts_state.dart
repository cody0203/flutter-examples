part of 'carts_cubit.dart';

abstract class CartsState extends Equatable {
  const CartsState({
    required this.cart,
    required this.isBottomSheetOpen,
  });
  final List<Cart> cart;
  final bool isBottomSheetOpen;

  @override
  List<Object> get props => <Object>[
        cart,
        isBottomSheetOpen,
      ];
}

class CartInit extends CartsState {
  CartInit()
      : super(
          cart: <Cart>[],
          isBottomSheetOpen: false,
        );

  @override
  List<Object> get props => <Object>[];
}

class AddToCartDone extends CartsState {
  const AddToCartDone(
    List<Cart> cart,
    bool isBottomSheetOpen,
  ) : super(
          cart: cart,
          isBottomSheetOpen: isBottomSheetOpen,
        );

  @override
  List<Object> get props => <Object>[
        cart,
        isBottomSheetOpen,
      ];
}

class CloseBottomSheet extends CartsState {
  const CloseBottomSheet(List<Cart> cart)
      : super(
          isBottomSheetOpen: false,
          cart: cart,
        );
}
