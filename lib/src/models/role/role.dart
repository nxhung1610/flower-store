class Role {
  late String sId;
  late int type;
  late String color;
  late String name;

  Role(
      {required this.sId,
      required this.color,
      required this.type,
      required this.name});

  Role.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    color = json['color'];
    type = json['type'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['color'] = this.color;
    data['type'] = this.type;
    data['name'] = this.name;
    return data;
  }
}
