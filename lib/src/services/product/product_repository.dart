import 'package:dio/dio.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:flower_store/src/utils/prefs/pref_keys.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

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

  Future<Response> submitAddProduct({
    required String name,
    required String image,
    required String description,
    required int basePrice,
  }) async {
    Dio _dio = Dio();
    _dio.options.headers["Authorization"] = 'Bearer $accessToken';
//multipart/form-data

    String mimeType = mime(image)!;
    String mimee = mimeType.split('/')[0];
    String type = mimeType.split('/')[1];
    var data = FormData.fromMap({
      "name": name,
      "description": description,
      "basePrice": basePrice,
      'image': await MultipartFile.fromFile(image,
          contentType: MediaType(mimee, type)),
    });

    print(
        "${data.fields} ${(await MultipartFile.fromFile(image, contentType: MediaType(mimee, type))).filename}");

    Response response = await _dio.post(
      "$baseUrl${this.endPoint}",
      data: data,
    );

    return response;
  }
}
