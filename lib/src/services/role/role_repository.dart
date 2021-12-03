import 'package:dio/dio.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/services/base/base_repository.dart';
import 'package:flower_store/src/services/base/base_response.dart';


class RoleRepostory extends BaseRepository {
  Future<Response> getRoles() async {
    try {
      var client = init();
      return await client.get('/role');
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }
}
