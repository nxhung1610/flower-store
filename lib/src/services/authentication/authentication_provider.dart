import 'package:dio/dio.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/services/authentication/authentication_repository.dart';
import 'package:flower_store/src/services/base/base_provider.dart';
import 'package:flower_store/src/services/base/base_repository.dart';
import 'package:flower_store/src/services/base/base_response.dart';

class AuthenticationProvider extends BaseProvider<AuthenticationRepository> {
  static final AuthenticationProvider _singleton =
      AuthenticationProvider._internal();

  factory AuthenticationProvider() {
    return _singleton;
  }
  AuthenticationProvider._internal() : super();

  @override
  AuthenticationRepository initRepository() {
    return AuthenticationRepository();
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    var res = await repository.login(email: email, password: password);
    return res.data["message"];
  }

  Future logout() async {
    await repository.logout();
  }

  Future<Staff> profileInfo() async {
    var res = await repository.profile();
    var staff = res.data["data"];
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
