import 'package:flower_store/src/models/staff.dart';
import 'package:flower_store/src/services/base/api_response.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:http/http.dart' as http;

abstract class AuthService {
  final String baseUrl = AppConstant.baseUrl;

  /// [email] Email of account.
  /// 
  /// [password] Password of account.
  /// 
  /// [Map] return the token auth vs token refesh.
  Future<APIResponse<Map<String, String>>> login({
    required String email,
    required String password,
  });

  /// [tokenRefesh] the token need to get new token auth to use rest api.
  /// 
  /// [String] return the token auth.
  Future<APIResponse<String>> requestNewToken({
    required String tokenRefesh,
  });
}

class AuthenticationService extends AuthService {
  AuthenticationService();

  @override
  Future<APIResponse<Map<String, String>>> login({
    required String email,
    required String password,
  }) async {
    return APIResponse(
      data: {

      },
    );
  }

  @override
  Future<APIResponse<String>> requestNewToken({required String tokenRefesh}) {
    // TODO: implement requestNewToken
    throw UnimplementedError();
  }
}
