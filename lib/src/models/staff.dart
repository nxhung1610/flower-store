class Staff {
  late String idStaff;
  late String name;
  late String phone;
  late String email;
  late String birthday;
  late String role;

  Staff(
      {required this.idStaff,
      required this.name,
      required this.phone,
      required this.email,
      required this.birthday,
      required this.role});

  Staff.fromJson(Map<String, dynamic> json) {
    idStaff = json['idStaff'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    birthday = json['birthday'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idStaff'] = this.idStaff;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['birthday'] = this.birthday;
    data['role'] = this.role;
    return data;
  }
}
