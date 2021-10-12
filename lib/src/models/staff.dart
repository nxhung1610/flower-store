class Staff {
  late String sId;
  late String name;
  String? phone;
  late String email;
  late String role;

  Staff({required this.sId, required this.name, this.phone, required this.email, required this.role});

  Staff.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
