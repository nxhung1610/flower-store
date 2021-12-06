import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/services/base/base_provider.dart';
import 'package:flower_store/src/services/base/base_repository.dart';
import 'package:flower_store/src/services/role/role_repository.dart';

class RoleProvider extends BaseProvider<RoleRepostory> {
  static final RoleProvider _singleton = RoleProvider._internal();

  factory RoleProvider() {
    return _singleton;
  }
  RoleProvider._internal() : super();

  @override
  RoleRepostory initRepository() {
    return RoleRepostory();
  }

  Future<List<Role>> getRoles() async {
    var res = await repository.getRoles();
    return (res.data["data"] as List).map((e) => Role.fromJson(e)).toList();
  }
}
