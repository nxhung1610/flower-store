import 'package:dio/dio.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/services/base/base_repository.dart';

class InvoiceRepository extends BaseRepository {
  Future<Response> bills() async {
    try {
      var client = init();
      final bills = await client.get('/bill');
      return bills;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future<Response> create({required Invoice invoice}) async {
    try {
      var client = init();
      final invoices = await client.post('/bill', data: invoice.toMap());
      return invoices;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }
}
