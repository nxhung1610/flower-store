import 'package:dio/dio.dart';
import 'package:flower_store/src/models/bill/bill.dart';
import 'package:flower_store/src/services/base/base_repository.dart';

class BillRepository extends BaseRepository {
  Future<Response> bills() async {
    try {
      var client = init();
      final bills = await client.get('/bill');
      return bills;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future<Response> create({required Bill bill}) async {
    try {
      var client = init();
      final bills = await client.post('/bill', data: bill.toMap());
      return bills;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }
}
