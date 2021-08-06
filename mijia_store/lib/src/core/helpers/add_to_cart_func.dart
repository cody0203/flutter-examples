import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cart.dart';
import '../../domain/entities/product.dart';
import '../../presentation/cubit/add_to_cart/add_to_cart_cubit.dart';
import '../../presentation/cubit/carts/carts_cubit.dart';
import '../../presentation/screens/detail_screen.dart';
import '../../presentation/widgets/shared/added_to_cart_bottom_sheet.dart';

void addToCartHelper({
  required BuildContext context,
  required Product product,
  required int amount,
  bool isShowBottomSheet = false,
  double? dx,
  double? dy,
  String? imageAsset,
}) {
  context.read<CartsCubit>().addToCart(
        Cart(
          product: product,
          amount: amount * product.pricePerKg,
          id: DateTime.now(),
        ),
      );
  if (isShowBottomSheet) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      elevation: 0,
      builder: (_) {
        return AddedToCartBottomSheet(
          name: product.name,
          imageAsset: product.imageAssets[0],
          amount: amount,
          pricePerKg: product.pricePerKg,
          currentRoute: DetailScreen.routeName,
          productId: product.id,
        );
      },
    );
  } else {
    context.read<AddToCartCubit>().addedFromList(
          dx: dx ?? 0,
          dy: dy ?? 0,
          isAdding: true,
          imageAsset: imageAsset ?? '',
        );
  }
}
