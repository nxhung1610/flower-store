import 'package:dio/dio.dart';
import 'package:flower_store/src/services/base/base_repository.dart';

class PackageRepository extends BaseRepository {
  Future<Response> pacakges() async {
    try {
      var client = init();
      final packages = await client.get('/package');
      return packages;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }
}
