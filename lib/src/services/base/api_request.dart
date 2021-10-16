import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flower_store/src/services/base/api_response.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:http/http.dart' as http;

enum RequestMethod { GET, PUT, POST, DELETE }

Future<APIResponse<T>> apiRequest<T>(
  String endPoint,
  RequestMethod method,
  T fromJson(Map<String, dynamic> o), {
  Object? body,
  String token = '',
}) async {
  late http.Response resp;
  final String url = AppConstant.baseUrl + endPoint;
  final Map<String, String> headers = new Map<String, String>();
  headers.putIfAbsent(
      HttpHeaders.contentTypeHeader, () => 'application/json; charset=utf-8');
  if (token.isNotEmpty) {
    headers.putIfAbsent(
        HttpHeaders.authorizationHeader, () => 'Bearer ' + token);
  }
  try {
    switch (method) {
      case RequestMethod.GET:
        resp = await http.get(
          Uri.parse(url),
          headers: headers,
        );
        break;
      case RequestMethod.PUT:
        resp = await http.put(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        );
        break;
      case RequestMethod.POST:
        resp = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        );
        break;
      case RequestMethod.DELETE:
        resp = await http.delete(
          Uri.parse(url),
          headers: headers,
        );
        break;
      default:
        throw new Error();
    }

    return APIResponse<T>.fromJson(
        jsonDecode(resp.body), (json) => fromJson(json));
  } on TimeoutException catch (e) {
    //handleTimeout();
    return APIResponse(error: true, message: e.message);
  } on SocketException catch (e) {
    print('Socket Error: $e');
    return APIResponse(error: true, message: e.message);
    //handleTimeout();
  } on Error catch (e) {
    print('General Error: $e');
    return APIResponse(error: true, message: 'General Error: $e');
    //showError();
  }
}
