import 'package:flower_store/src/models/request/request.dart';
import 'package:flower_store/src/services/base/base_provider.dart';

import 'request_repository.dart';

class RequestProvider extends BaseProvider<RequestRepository> {
  @override
  RequestRepository initRepository() {
    return RequestRepository();
  }

  Future<List<Request>> get() async {
    final res = await repository.requests();
    return (res.data['data'] as List).map((e) => Request.fromMap(e)).toList();
  }

  Future create({required Request request}) async {
    await repository.create(request: request);
  }

  Future approve({required Request request}) async {
    await repository.approve(request: request);
  }

  Future done({required Request request}) async {
    await repository.done(request: request);
  }

  Future cancel({required Request request}) async {
    await repository.cancel(request: request);
  }
}
