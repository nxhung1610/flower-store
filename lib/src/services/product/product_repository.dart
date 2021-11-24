import 'package:dio/dio.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:flower_store/src/utils/prefs/pref_keys.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';

class ProductRepository {
  static final ProductRepository _singleton = ProductRepository._internal();

  factory ProductRepository() {
    return _singleton;
  }
  ProductRepository._internal();
  final baseUrl = AppConstant.baseUrl;
  final String endPoint = 'product';

  final accessToken = AppPreferences.prefs.getString(PrefKeys.ACCESS_TOKEN);

  Future<Response> getAllProduct() async {
    Dio _dio = Dio();
    _dio.options.headers = {'Authorization': 'Bearer $accessToken'};
    Response response = await _dio.get("$baseUrl${this.endPoint}");
    return response;
  }
}
