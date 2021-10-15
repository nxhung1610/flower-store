class APIResponse<T> {
  T? data;
  late bool error;
  String? errorMessage;
  APIResponse({this.data, this.errorMessage, this.error = false});

  APIResponse.fromJson(
      Map<String, dynamic> json, T fromJson(Map<String, dynamic> o)) {
    data = fromJson(json['data']);
    error = json['error'];
    errorMessage = json['message'];
  }
}
