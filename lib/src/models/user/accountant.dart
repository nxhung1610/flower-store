import '../model.dart';

class Accountant extends Staff {
  Accountant(
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

  Accountant.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
