import 'package:flower_store/src/models/role/role_type.dart';

abstract class Staff<T> {
  final String sId;
  final String name;
  final String? phone;
  final String email;
  final RoleType role;
  final String url;

  Staff(
      {required this.sId,
      required this.name,
      this.phone,
      required this.email,
      required this.role,
      required this.url});

  Staff.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        name = json['name'],
        phone = json['phone'],
        email = json['email'],
        role = RoleType.values[json['role']],
        url = json['url'];

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
