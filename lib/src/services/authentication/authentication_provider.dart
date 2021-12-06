import 'package:dio/dio.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/models/user/user_helper.dart';
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

  Future login({
    required String email,
    required String password,
  }) async {
    await repository.login(email: email, password: password);
  }

  Future logout() async {
    await repository.logout();
  }

  Future<Staff> profileInfo() async {
    var res = await repository.profile();
    var staff = res.data["data"];
    return UserHelper().convertToType(staff);
  }

  Future<List<Role>> roles() async {
    var res = await repository.getRoles();
    var roles = res.data["data"] as List;
    return roles.map((e) => Role.fromJson(e)).toList();
  }

  Future<List<Staff>> staffs() async {
    var res = await repository.getStaffs();
    var staffs = res.data["data"] as List;
    return staffs.map((e) => UserHelper().convertToType(e)).toList();
  }
}
