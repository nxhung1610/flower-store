import '../model.dart';

class UserHelper {
  static final UserHelper _singleton = UserHelper._internal();
  factory UserHelper() {
    return _singleton;
  }
  UserHelper._internal();

  Staff convertToType(Map<String, dynamic> staff) {
    switch (RoleType.values[staff['role']]) {
      case RoleType.Manager:
        return Manager.fromJson(staff);
      case RoleType.Warehouse:
        return Warehouse.fromJson(staff);
      case RoleType.Accountant:
        return Accountant.fromJson(staff);
      case RoleType.Seller:
        return Seller.fromJson(staff);
    }
  }
}
