import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(const AddToCartInit());

  Future<void> addedFromList({
    required double dx,
    required double dy,
    required bool isAdding,
    required String imageAsset,
  }) async {
    try {

      emit(
        AddedFromList(
          dx: dx,
          dy: dy,
          isAdding: isAdding,
          imageAsset: imageAsset,
        ),
      );
    } on Exception {
      print('addedFromList error');
    }
  }
}
