import 'package:flower_store/src/models/bill/bill.dart';
import 'package:flower_store/src/services/base/base_provider.dart';
import 'package:flower_store/src/services/bill/bill_repository.dart';

class BillProvider extends BaseProvider<BillRepository> {
  @override
  BillRepository initRepository() {
    return BillRepository();
  }

  Future<List<Bill>> get() async {
    final res = await repository.bills();
    return (res.data['data'] as List).map((e) => Bill.fromJson(e)).toList();
  }

  Future create({required Bill bill}) async {
    await repository.create(bill: bill);
  }
}
