import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/cart/cart_product.dart';

abstract class CartEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CartBottomDialogAmountIncrementPressed extends CartEvent {}

class CartBottomDialogAmountDecrementPressed extends CartEvent {}

class CartBottomDialogPressed extends CartEvent {
  final CartProduct selectedProduct;

  CartBottomDialogPressed({
    required this.selectedProduct,
  });
  @override
  List<Object> get props => [selectedProduct];
}

class CartBottomDialogAddPress extends CartEvent {}

class CartRemoveProduct extends CartEvent {
  final CartProduct selectedProduct;

  CartRemoveProduct({
    required this.selectedProduct,
  });
  @override
  List<Object> get props => [selectedProduct];
}

class CartCartPageAmountIncrementPressed extends CartEvent {
  final CartProduct selectedProduct;

  CartCartPageAmountIncrementPressed({
    required this.selectedProduct,
  });
  @override
  List<Object> get props => [selectedProduct];
}

class CartCartPageAmountDecrementPressed extends CartEvent {
  final CartProduct selectedProduct;

  CartCartPageAmountDecrementPressed({
    required this.selectedProduct,
  });
  @override
  List<Object> get props => [selectedProduct];
}
