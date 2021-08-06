import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/cart.dart';

part 'carts_state.dart';

class CartsCubit extends Cubit<CartsState> {
  CartsCubit() : super(CartInit());

  Future<void> addToCart(Cart cartItem) async {
    try {
      final int productId = cartItem.product.id;
      final int isProductExist = state.cart.indexWhere(
        (Cart cartItem) => cartItem.product.id == productId,
      );

      if (isProductExist > -1) {
        state.cart[isProductExist] = Cart(
          product: cartItem.product,
          amount: state.cart[isProductExist].amount + cartItem.amount,
          id: cartItem.id,
        );
      } else {
        state.cart.add(cartItem);
      }

      emit(AddToCartDone(state.cart, true));
    } on Exception {
      print('addToCart error');
    }
  }

  Future<void> removeCartItem(DateTime id) async {
    try {
      final List<Cart> newCart =
          state.cart.where((Cart cartItem) => cartItem.id != id).toList();

      emit(AddToCartDone(newCart, false));
    } on Exception {
      print('removeCartItem error');
    }
  }
}
