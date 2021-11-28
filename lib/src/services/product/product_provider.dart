import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/services/product/product_repository.dart';

class ProductProvider {
  static final ProductProvider _singleton = ProductProvider._internal();

  factory ProductProvider() {
    return _singleton;
  }

  ProductProvider._internal();

  Future<List<Product>> getAllProduct() async {
    final response = await ProductRepository().getAllProduct();

    final jsonResultList = (response.data["data"] as List);
    List<Product> productList = jsonResultList
        .map((productJSon) => Product.fromJson(productJSon))
        .toList();
    return productList;
  }

  Future<void> submitProduct({
    required String name,
    required String image,
    required String description,
    required int basePrice,
  }) async {
    final response = await ProductRepository().submitAddProduct(
        name: name,
        image: image,
        description: description,
        basePrice: basePrice);
  }
}
