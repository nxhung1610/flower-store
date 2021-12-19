import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/cart/cart_product.dart';

import '../../product.dart';

class DetailBill extends Equatable {
  final Product product;
  final int? quantity;
  final int? totalPrice;

  const DetailBill({required this.product, this.quantity, this.totalPrice});

  factory DetailBill.fromMap(Map<String, dynamic> data) => DetailBill(
        product: Product.fromJson(data['product'] as Map<String, dynamic>),
        quantity: data['quantity'] as int?,
        totalPrice: data['totalPrice'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'product': product.toJson(),
        'quantity': quantity,
        'totalPrice': totalPrice,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DetailBill].
  factory DetailBill.fromJson(String data) {
    return DetailBill.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DetailBill] to a JSON string.
  String toJson() => json.encode(toMap());

  DetailBill copyWith({
    Product? product,
    int? quantity,
    int? totalPrice,
  }) {
    return DetailBill(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  factory DetailBill.fromCartProduct({required CartProduct cartProduct}) {
    return DetailBill(
      product: cartProduct,
      quantity: cartProduct.quantity,
      totalPrice: (cartProduct.basePrice * cartProduct.quantity),
    );
  }

  @override
  List<Object?> get props => [product, quantity, totalPrice];
}
