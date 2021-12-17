import '../model.dart';

class Supplier extends Staff {
  Supplier(
      {required sId,
      required name,
      phone,
      required email,
      required role,
      required url})
      : super(
            sId: sId,
            name: name,
            phone: phone,
            email: email,
            role: role,
            url: url);

  Supplier.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
