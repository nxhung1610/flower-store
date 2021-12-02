import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/services/authentication/authentication_provider.dart';
import 'package:flower_store/src/services/base/base_provider.dart';
import 'package:flower_store/src/services/base/base_repository.dart';
import 'package:flower_store/src/services/base/base_response.dart';

class AuthenticationRepository extends BaseRepository {
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    try {
      var client = init();
      var res = await client.post('/staff/login', data: {
        'email': email,
        'password': password,
      });
      if (!res.data["error"])
        BaseRepository.tokenAuth = res.data["accessToken"];
      return res;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future<Response> logout() async {
    try {
      var client = init();
      var res = await client.post('/staff/logout', data: {
        'accessToken': BaseRepository.tokenAuth,
      });
      if (!res.data["error"]) clearSession();
      return res;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future<Response> profile() async {
    try {
      var client = init();
      var res = await client.get('/staff/profile');
      return res;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }
}
