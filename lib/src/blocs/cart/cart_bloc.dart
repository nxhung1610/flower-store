import 'package:flower_store/src/blocs/cart/cart_event.dart';
import 'package:flower_store/src/blocs/cart/cart_state.dart';
import 'package:flower_store/src/models/cart/cart_product.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optional/optional.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(selectedProduct: null, cartProducts: [])) {
    on<CartBottomDialogAmountIncrementPressed>((event, emit) {
      if (state.selectedProduct == null) return;

      final selectedProduct = state.selectedProduct
          ?.copyWith(quantity: state.selectedProduct!.quantity + 1);
      final newState =
          state.copyWith(selectedProduct: Optional.ofNullable(selectedProduct));
      emit(newState);
    });
    on<CartBottomDialogAmountDecrementPressed>((event, emit) {
      final selectedProduct;
      if (state.selectedProduct == null) return;
      if (state.selectedProduct!.quantity <= 1) {
        selectedProduct = state.selectedProduct?.copyWith(quantity: 1);
        return;
      }
      selectedProduct = state.selectedProduct
          ?.copyWith(quantity: state.selectedProduct!.quantity - 1);
      emit(state.copyWith(
          selectedProduct: Optional.ofNullable(selectedProduct)));
    });
    on<CartBottomDialogPressed>((event, emit) {
      emit(state.copyWith(
          selectedProduct: Optional.ofNullable(event.selectedProduct)));
    });
    on<CartBottomDialogAddPress>((event, emit) {
      if (state.cartProducts.any((e) => e.sId == state.selectedProduct!.sId)) {
        final newList = [...state.cartProducts];
        final oldProduct = newList
            .indexWhere((element) => element.sId == state.selectedProduct!.sId);
        newList[oldProduct] = newList[oldProduct].copyWith(
            quantity:
                newList[oldProduct].quantity + state.selectedProduct!.quantity);
        emit(state.copyWith(cartProducts: newList));
      } else
        emit(state.copyWith(
            selectedProduct: Optional.ofNullable(state.selectedProduct),
            cartProducts: [...state.cartProducts, state.selectedProduct!]));
    });
    on<CartRemoveProduct>((event, emit) {
      final newList = [...state.cartProducts];
      newList
          .removeWhere((element) => element.sId == event.selectedProduct.sId);
      emit(state.copyWith(cartProducts: newList));
    });
    on<CartCartPageAmountIncrementPressed>((event, emit) {
      final newList = [...state.cartProducts];
      final eventId = event.selectedProduct.sId;
      var oldProduct = newList.indexWhere((element) => element.sId == eventId);
      newList[oldProduct] = newList[oldProduct]
          .copyWith(quantity: newList[oldProduct].quantity + 1);
      emit(state.copyWith(cartProducts: newList));
    });
    on<CartCartPageAmountDecrementPressed>((event, emit) {
      if (event.selectedProduct.quantity <= 1) return;
      final newList = [...state.cartProducts];
      final eventId = event.selectedProduct.sId;
      var oldProduct = newList.indexWhere((element) => element.sId == eventId);
      newList[oldProduct] = newList[oldProduct]
          .copyWith(quantity: newList[oldProduct].quantity - 1);
      emit(state.copyWith(cartProducts: newList));
    });
    on<CartClear>((event, emit) {
      emit(state.copyWith(cartProducts: []));
    });
  }
}
