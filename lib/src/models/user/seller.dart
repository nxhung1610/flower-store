import '../model.dart';

class Seller extends Staff {
  Seller(
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

  Seller.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
