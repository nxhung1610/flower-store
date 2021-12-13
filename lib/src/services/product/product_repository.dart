import 'package:dio/dio.dart';
import 'package:flower_store/src/services/base/base_repository.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:flower_store/src/utils/prefs/pref_keys.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class ProductRepository extends BaseRepository {
  Future<Response> getAllProduct() async {
    var client = init();
    return await client.get("/product");
  }

  Future<Response> submitAddProduct({
    required String name,
    required String imagePath,
    required String description,
    required int basePrice,
  }) async {
    var client = init();
    var image;
    if (imagePath.isNotEmpty) {
      String mimeType = mime(imagePath)!;
      String mimee = mimeType.split('/')[0];
      String type = mimeType.split('/')[1];
      image = await MultipartFile.fromFile(image,
          contentType: MediaType(mimee, type));
    }

    var data = FormData.fromMap({
      "name": name,
      "description": description,
      "basePrice": basePrice,
      'image': image,
    });

    var res = await client.post(
      "/product",
      data: data,
    );

    return res;
  }

  Future<Response> updateProduct({
    required String sId,
    required String name,
    required String image,
    required String description,
    required int basePrice,
  }) async {
    var client = init();

    String mimeType = '';
    String mimee = '';
    String type = '';
    final result = image.contains('http');
    if (!result) {
      mimeType = mime(image)!;
      mimee = mimeType.split('/')[0];
      type = mimeType.split('/')[1];
    }

    var data = FormData.fromMap({
      "name": name,
      "description": description,
      "basePrice": basePrice,
      if (!result)
        'image': await MultipartFile.fromFile(image,
            contentType: MediaType(mimee, type)),
    });

    var res = await client.patch(
      "/product/$sId",
      data: data,
    );

    return res;
  }

  Future<Response> deleteProduct({required String sId}) async {
    var client = init();

    var res = await client.delete("/product/$sId");
    return res;
  }
}
