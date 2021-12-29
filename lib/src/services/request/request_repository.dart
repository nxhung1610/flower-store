import 'package:dio/dio.dart';
import 'package:flower_store/src/blocs/request/request_bloc.dart';
import 'package:flower_store/src/models/enums.dart';
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

  Future<Response> approve({required Request request}) async {
    try {
      var client = init();
      final requestApprove =
          await client.patch('/request/${request.id}/approve');
      return requestApprove;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future<Response> done({required Request request}) async {
    try {
      var client = init();
      final requestDone = await client.patch(
        '/request/${request.id}/status',
        data: {
          'status': RequestStatus.Done.index,
        },
      );
      return requestDone;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }

  Future<Response> cancel({required Request request}) async {
    try {
      var client = init();
      final requestCancel = await client.patch(
        '/request/${request.id}/status',
        data: {
          'status': RequestStatus.Cancel.index,
        },
      );
      return requestCancel;
    } on DioError catch (error) {
      throw error.response as Response;
    }
  }
}
