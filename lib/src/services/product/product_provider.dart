import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/services/base/base_provider.dart';
import 'package:flower_store/src/services/product/product_repository.dart';

class ProductProvider extends BaseProvider<ProductRepository> {
  @override
  ProductRepository initRepository() {
    return ProductRepository();
  }

  Future<List<Product>> getAllProduct() async {
    final response = await repository.getAllProduct();

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
    await repository.submitAddProduct(
        name: name,
        imagePath: image,
        description: description,
        basePrice: basePrice);
  }

  Future<void> updateProduct({
    required String name,
    required String image,
    required String description,
    required int basePrice,
    required String sId,
  }) async {
    await repository.updateProduct(
        sId: sId,
        name: name,
        image: image,
        description: description,
        basePrice: basePrice);
  }

  Future<void> deleteProduct({
    required String sId,
  }) async {
    await repository.deleteProduct(
      sId: sId,
    );
  }
}
