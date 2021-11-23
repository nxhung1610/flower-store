class Product {
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
    image = json['image'];
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
}
