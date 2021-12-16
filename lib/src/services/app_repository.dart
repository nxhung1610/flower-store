import 'authentication/authentication_provider.dart';

class AppRepository {
  static final AppRepository _singleton = AppRepository._internal();

  factory AppRepository() {
    return _singleton;
  }
  AppRepository._internal();

  AuthenticationProvider get authentication => AuthenticationProvider();
}
