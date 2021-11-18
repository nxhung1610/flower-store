import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/models/user/accountant.dart';
import 'package:flower_store/src/models/user/seller.dart';
import 'package:flower_store/src/models/user/warehouse.dart';
import 'package:flower_store/src/services/base/api_request.dart';
import 'package:flower_store/src/services/base/api_response.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

abstract class AuthService {
  final String endPoint = 'staff';

  /// [email] Email of account.
  ///
  /// [password] Password of account.
  ///
  /// [Map] return the token auth vs token refesh.
  Future<APIResponse<Map<String, dynamic>?>> login({
    required String email,
    required String password,
  });

  /// [accessToken]
  Future<APIResponse<Staff?>> getProfile({
    required String accessToken,
  });

  /// [refeshToken] the token need to get new token access to use rest api.
  Future<APIResponse<Map<String, dynamic>?>> logout({
    required String accessToken,
  });
}

class AuthServiceImpl extends AuthService {
  AuthServiceImpl();

  @override
  Future<APIResponse<Map<String, dynamic>?>> login({
    required String email,
    required String password,
  }) async {
    return await apiRequest(
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
  Future<APIResponse<Map<String, dynamic>?>> logout({
    required String accessToken,
  }) async {
    return await apiRequest(
      '$endPoint/logout',
      RequestMethod.POST,
      (json) => json,
      body: {'accessToken': accessToken},
    );
  }

  @override
  Future<APIResponse<Staff?>> getProfile({required String accessToken}) async {
    return await apiRequest(
      '$endPoint/profile',
      RequestMethod.GET,
      (json) {
        final value = (json as Map<String, dynamic>)['role'];
        switch (RoleType.values[value]) {
          case RoleType.Manager:
            return Manager.fromJson(json);
          case RoleType.Warehouse:
            return Warehouse.fromJson(json);
          case RoleType.Accountant:
            return Accountant.fromJson(json);
          case RoleType.Seller:
            return Seller.fromJson(json);
        }
      },
      token: accessToken,
    );
  }
}
