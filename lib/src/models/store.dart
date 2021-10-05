class Store {
  late String idStore;
  late String deviceCode;
  late String name;
  late String address;
  late String phone;

  Store(
      {required this.idStore,
      required this.deviceCode,
      required this.name,
      required this.address,
      required this.phone});

  Store.fromJson(Map<String, dynamic> json) {
    idStore = json['idStore'];
    deviceCode = json['deviceCode'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idStore'] = this.idStore;
    data['deviceCode'] = this.deviceCode;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    return data;
  }
}
