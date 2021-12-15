import 'package:flower_store/src/models/product.dart';

class CartProduct extends Product {
  CartProduct.fromProduct(Product product, {this.quantity = 1})
      : super.copy(product: product);
  final int quantity;

  @override
  // TODO: implement props
  List<Object?> get props => [this.sId, this.quantity];

  CartProduct(
      {required sId,
      required name,
      required image,
      required description,
      required basePrice,
      this.quantity = 1})
      : super(
            sId: sId,
            name: name,
            image: image,
            description: description,
            basePrice: basePrice);

  CartProduct copyWith({
    int? quantity,
  }) {
    return CartProduct(
        quantity: quantity ?? this.quantity,
        sId: this.sId,
        name: this.name,
        image: this.image,
        description: this.description,
        basePrice: this.basePrice);
  }
}
