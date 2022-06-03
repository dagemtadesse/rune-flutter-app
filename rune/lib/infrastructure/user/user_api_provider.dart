import 'package:rune/domain/user/user_model.dart';

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

      print(apiResponse.message);
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<User> update(
      {String? fullName,
      String? email,
      String? password,
      String? imagePath,
      required String authToken}) async {
    try {
      final request = http.MultipartRequest(
        'PUT',
        Uri.parse("$baseURL/user"),
      );

      request.headers['Authorization'] = 'Bearer $authToken';
      if (email != null) request.fields['email'] = email;
      if (fullName != null) request.fields['email'] = fullName;
      if (password != null) request.fields['password'] = password;
      if (imagePath != null) {
        request.files
            .add(await http.MultipartFile.fromPath("avatar", imagePath));
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      print(responseBody);
      final apiResponse = APIResponse.fromJson(jsonDecode(responseBody));

      if (apiResponse.status == 'success') {
        return User.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  Future<User?> fetchUser(int userId, String authToken) async {
    try {
      final response = await http.get(Uri.parse("$baseURL/user/id/$userId"),
          headers: {'Authorization': 'Bearer $authToken'});
      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        if (apiResponse.data == null) return null;
        return User.fromJson(apiResponse.data as Map<String, dynamic>);
      }
      throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }

  removeAccount(String authToken) async {
    try {
      final response = await http.delete(Uri.parse("$baseURL/user/"),
          headers: {'Authorization': 'Bearer $authToken'});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status != 'success') throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }
}
