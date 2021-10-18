class APIResponse<T> {
  T? data;
  late bool error;
  String? message;
  APIResponse({this.data, this.message, this.error = false});

  APIResponse.fromJson(Map<String, dynamic> json, T fromJson(dynamic o)) {
    data = fromJson(json['data']);
    error = json['error'];
    message = json['message'];
  }
}
