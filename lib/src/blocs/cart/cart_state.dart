import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flower_store/src/models/cart/cart_product.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:optional/optional.dart';

class CartState extends Equatable {
  final CartProduct? selectedProduct;
  final List<CartProduct> cartProducts;
  CartState({
    required this.selectedProduct,
    required this.cartProducts,
  });

  CartState copyWith({
    List<CartProduct>? cartProducts,
    Optional<CartProduct?>? selectedProduct,
  }) {
    return CartState(
      selectedProduct: selectedProduct != null
          ? selectedProduct.orElseNull
          : this.selectedProduct,
      cartProducts: cartProducts ?? this.cartProducts,
    );
  }

  @override
  List<Object?> get props => [this.cartProducts, selectedProduct];
}
