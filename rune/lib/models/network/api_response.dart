class APIResponse<T> {
  final String status;
  final int statusCode;
  final String? message;
  T? data;

  APIResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        statusCode = json['statusCode'],
        message = json['message'],
        data = json['data'];
}
