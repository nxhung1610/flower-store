class Role {
  late String idRole;
  late String name;

  Role({required this.idRole, required this.name});

  Role.fromJson(Map<String, dynamic> json) {
    idRole = json['idRole'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idRole'] = this.idRole;
    data['name'] = this.name;
    return data;
  }
}
