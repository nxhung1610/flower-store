import 'package:dio/dio.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/models/request/request.dart';
import 'package:flower_store/src/services/base/base_repository.dart';

class RequestRepository extends BaseRepository {
  Future<Response> requests() async {
    try {
      var client = init();
      final requests = await client.get('/request');
      return requests;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future<Response> create({required Request request}) async {
    try {
      var client = init();
      final requestCreate =
          await client.post('/request', data: request.toMap());
      return requestCreate;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }
}
