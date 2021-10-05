class StoreInfoStaff {
  late String idInfoStaff;
  late String idStore;
  late String idStaff;
  late int pincode;

  StoreInfoStaff(
      {required this.idInfoStaff,
      required this.idStore,
      required this.idStaff,
      required this.pincode});

  StoreInfoStaff.fromJson(Map<String, dynamic> json) {
    idInfoStaff = json['idInfoStaff'];
    idStore = json['idStore'];
    idStaff = json['idStaff'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idInfoStaff'] = this.idInfoStaff;
    data['idStore'] = this.idStore;
    data['idStaff'] = this.idStaff;
    data['pincode'] = this.pincode;
    return data;
  }
}
