import 'package:rune/domain/user/user.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rune/infrastructure/api_response.dart';

class UserAPIProvider {
  final String baseURL;

  UserAPIProvider(this.baseURL);

  Future<User> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseURL/auth-token"),
        body: {'email': email, 'password': password},
      );

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return User.fromJson(apiResponse.data);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<User> register(String fullName, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseURL/user"),
        body: {
          'fullname': fullName,
          'email': email,
          'password': password,
        },
      );

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return User.fromJson(apiResponse.data as Map<String, dynamic>);
      }

      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<User> changePassword(String oldPassword, String newPassword) {
    throw UnimplementedError();
  }
}
