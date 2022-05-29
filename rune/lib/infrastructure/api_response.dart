class APIResponse {
  final int statusCode;
  final String status;
  final dynamic data;
  final String? message;

  APIResponse(
      {required this.statusCode,
      required this.status,
      this.data,
      this.message});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
        statusCode: json['statusCode'],
        status: json['status'],
        data: json['data'],
        message: json['message']);
  }

  static const String serverConnectionError = "Unable to connect to the server";
}
