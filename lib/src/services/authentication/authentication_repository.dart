import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/services/authentication/authentication_provider.dart';
import 'package:flower_store/src/services/base/base_provider.dart';
import 'package:flower_store/src/services/base/base_repository.dart';
import 'package:flower_store/src/services/base/base_response.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

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
        BaseRepository.tokenAuth = res.data["data"]["accessToken"];
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

  Future<Response> getRoles() async {
    try {
      var client = init();
      var res = await client.get('/role');
      return res;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future<Response> getStaffs() async {
    try {
      var client = init();
      var res = await client.get('/staff');
      return res;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future<Response> register(
      {required String avatarPath,
      required String nameStaff,
      required RoleType role,
      required String phoneNumber,
      required String emailAddress,
      required String password}) async {
    try {
      var client = init();
      var imageData;
      if (avatarPath.isNotEmpty) {
        String mimeType = mime(avatarPath)!;
        String mimee = mimeType.split('/')[0];
        String type = mimeType.split('/')[1];
        imageData = await MultipartFile.fromFile(avatarPath,
            contentType: MediaType(mimee, type));
      }

      var data = FormData.fromMap({
        "name": nameStaff,
        "email": emailAddress,
        "phone": phoneNumber,
        "password": password,
        "role": role.index,
        'image': imageData,
      });
      var res = await client.post('/staff/register', data: data);
      return res;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future<Response> update({
    required String staffId,
    required bool isAvatarLocal,
    required String avatarPath,
    required String? nameStaff,
    required RoleType? role,
    required String? phoneNumber,
    required String? emailAddress,
  }) async {
    try {
      var client = init();
      var imageData;
      if (isAvatarLocal && avatarPath.isNotEmpty) {
        String mimeType = mime(avatarPath)!;
        String mimee = mimeType.split('/')[0];
        String type = mimeType.split('/')[1];
        imageData = await MultipartFile.fromFile(avatarPath,
            contentType: MediaType(mimee, type));
      }
      var mapData = {
        "name": nameStaff,
        "email": emailAddress,
        "phone": phoneNumber,
        "role": role?.index,
        'image': imageData,
      };
      mapData.removeWhere((key, value) => value == null);
      var data = FormData.fromMap(mapData);

      var res = await client.patch('/staff/$staffId', data: data);
      return res;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future delete({
    required String staffId,
  }) async {
    try {
      var client = init();
      await client.delete('/staff/$staffId');
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }
}
