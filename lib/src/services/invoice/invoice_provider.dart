
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/services/base/base_provider.dart';
import 'package:flower_store/src/services/invoice/invoice_repository.dart';

class InvoiceProvider extends BaseProvider<InvoiceRepository> {
  @override
  InvoiceRepository initRepository() {
    return InvoiceRepository();
  }

  Future<List<Invoice>> get() async {
    final res = await repository.bills();
    return (res.data['data'] as List).map((e) => Invoice.fromJson(e)).toList();
  }

  Future create({required Invoice invoice}) async {
    await repository.create(invoice: invoice);
  }
}
