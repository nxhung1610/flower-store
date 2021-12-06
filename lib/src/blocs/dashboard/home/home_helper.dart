import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/services/product/product_provider.dart';
import 'package:flower_store/src/services/product/product_repository.dart';

List<Product> _productList = [];

List<Product> get product {
  loadProduct();
  return _productList;
}

void loadProduct() async {
  _productList = await ProductProvider().getAllProduct();
}
