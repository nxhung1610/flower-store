import 'package:equatable/equatable.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';

class Product extends Equatable {
  late String sId;
  late String name;
  late String image;
  late String description;
  late int basePrice;

  Product(
      {required this.sId,
      required this.name,
      required this.image,
      required this.description,
      required this.basePrice});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = '${AppConstant.baseUrl}${json['image']}';
    description = json['description'];
    basePrice = json['basePrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['basePrice'] = this.basePrice;
    return data;
  }

  @override
  String toString() {
    return 'Product(sId: $sId, name: $name, image: $image, description: $description, basePrice: $basePrice)';
  }

  toMap() {}

  static fromMap(x) {}

  Product.copy({required Product product}) {
    this.sId = product.sId;
    this.name = product.name;
    this.image = product.image;
    this.description = product.description;
    this.basePrice = product.basePrice;
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [this.sId, this.name, this.image, this.description, this.basePrice];
}
