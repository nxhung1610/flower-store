class BaseResponse<T> {
  T? data;
  late bool error;
  String? message;
  BaseResponse({this.data, this.message, this.error = false});

  BaseResponse.fromJson(Map<String, dynamic> json, T fromJson(dynamic o)) {
    data = fromJson(json['data']);
    error = json['error'];
    message = json['message'];
  }
}
