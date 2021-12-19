import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../product.dart';

class Package extends Equatable {
  final Product product;
  final int quantity;
  final String id;

  const Package({required this.id, required this.product, this.quantity = 0});

  factory Package.fromMap(Map<String, dynamic> data) => Package(
        product: Product.fromJson(data['product'] as Map<String, dynamic>),
        quantity: data['quantity'] as int,
        id: data['_id'],
      );

  Map<String, dynamic> toMap() => {
        'product': product.toJson(),
        'quantity': quantity,
        '_id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DetailBill].
  factory Package.fromJson(String data) {
    return Package.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DetailBill] to a JSON string.
  String toJson() => json.encode(toMap());

  Package copyWith({
    Product? product,
    int? quantity,
    String? id,
  }) {
    return Package(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [product, quantity, id];
}
