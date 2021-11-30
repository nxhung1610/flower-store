import 'package:dio/dio.dart';

import 'package:flower_store/app.dart';
import 'package:flower_store/src/services/base/base_provider.dart';
import 'package:flower_store/src/services/base/repository_impl.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:flower_store/src/utils/prefs/pref_keys.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseRepository implements IRepository {
  static String get tokenAuth =>
      AppPreferences.prefs.getString(PrefKeys.ACCESS_TOKEN) ?? '';

  @protected
  static set tokenAuth(String value) =>
      AppPreferences.prefs.setString(PrefKeys.ACCESS_TOKEN, value);

  @protected
  void clearSession() {
    AppPreferences.prefs.remove(PrefKeys.ACCESS_TOKEN);
  }

  @protected
  Dio init() {
    Dio _dio = new Dio();
    _dio.options.baseUrl = AppConstant.baseUrl;
    _dio.options.responseType = ResponseType.json;
    if (tokenAuth.isNotEmpty)
      _dio.options.headers = {'Authorization': 'Bearer $tokenAuth'};
    return _dio;
  }

  BaseRepository();
}
