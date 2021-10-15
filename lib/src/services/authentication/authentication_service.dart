import 'dart:convert';
import 'dart:io';

import 'package:flower_store/src/models/staff.dart';
import 'package:flower_store/src/services/base/api_request.dart';
import 'package:flower_store/src/services/base/api_response.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:http/http.dart' as http;

abstract class AuthService {
  final String endPoint = 'staff';

  /// [email] Email of account.
  ///
  /// [password] Password of account.
  ///
  /// [Map] return the token auth vs token refesh.
  Future<APIResponse<Map<String, dynamic>>> login({
    required String email,
    required String password,
  });

  /// [refeshToken] the token need to get new token auth to use rest api.
  ///
  /// [String] return the token auth.
  Future<APIResponse<Map<String, dynamic>>> requestNewToken({
    required String refeshToken,
  });

  Future<APIResponse<Map<String, dynamic>>> logout({
    required String accessToken,
    required String refeshToken,
  });
}

class AuthServiceImpl extends AuthService {
  AuthServiceImpl();

  @override
  Future<APIResponse<Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    return apiRequest(
      '$endPoint/login',
      RequestMethod.POST,
      (json) => json,
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  @override
  Future<APIResponse<Map<String, dynamic>>> requestNewToken({
    required String refeshToken,
  }) {
    // TODO: implement requestNewToken
    throw UnimplementedError();
  }

  @override
  Future<APIResponse<Map<String, dynamic>>> logout({
    required String accessToken,
    required String refeshToken,
  }) {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
