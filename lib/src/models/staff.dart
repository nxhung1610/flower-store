import 'package:flower_store/src/models/role/role_type.dart';

class Staff {
  String sId;
  String name;
  String? phone;
  String email;
  RoleType role;
  String url;

  Staff(
      {required this.sId,
      required this.name,
      this.phone,
      required this.email,
      required this.role,
      required this.url});

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
        sId: json['_id'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        role: RoleType.values[json['role']],
        url: json['url']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['role'] = this.role.index;
    data['url'] = this.url;
    return data;
  }
}
