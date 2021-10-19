import 'package:flower_store/src/models/role.dart';
import 'package:flower_store/src/models/staff.dart';
import 'package:flower_store/src/services/base/api_request.dart';
import 'package:flower_store/src/services/base/api_response.dart';

abstract class RoleService {
  final String endPoint = 'role';

  Future<APIResponse<List<Role>?>> getRoles();
}

class RoleServiceImpl extends RoleService {
  @override
  Future<APIResponse<List<Role>?>> getRoles() async {
    return await apiRequest(
      '$endPoint',
      RequestMethod.GET,
      (json) => (json as List).map((e) => Role.fromJson(e)).toList(),
    );
  }
}
