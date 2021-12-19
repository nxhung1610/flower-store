import 'package:flower_store/src/services/invoice/invoice_provider.dart';
import 'package:flower_store/src/services/package/package_provider.dart';
import 'package:flower_store/src/services/product/product_provider.dart';

import 'authentication/authentication_provider.dart';

class AppRepository {
  static final AppRepository _singleton = AppRepository._internal();

  factory AppRepository() {
    return _singleton;
  }
  AppRepository._internal();

  AuthenticationProvider get authentication => AuthenticationProvider();

  InvoiceProvider get invoice => InvoiceProvider();

  PackageProvider get package => PackageProvider();

  ProductProvider get product => ProductProvider();
}
