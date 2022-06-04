import 'package:rune/domain/models.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rune/infrastructure/api_response.dart';
import 'dart:developer' as developer;

class UserAPIProvider {
  final String host;

  UserAPIProvider(this.host);

  Future<User> login(String email, String password) async {
    try {
      developer.log(Uri.http(host, "/auth-token").toString());
      final response = await http.post(
        Uri.http(host, "/api/v1/auth-token"),
        body: {'email': email, 'password': password},
      );
      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status == 'success') {
        return User.fromJson(apiResponse.data);
      }
      throw apiResponse;
    } catch (error) {
      developer.log("$error");
      throw APIResponse.serverConnectionError;
    }
  }

  Future<User> register(String fullName, String email, String password) async {
    try {
      final response = await http.post(
        Uri.http(host, "/api/v1/user"),
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
      String? handle,
      String? password,
      String? imagePath,
      required String authToken}) async {
    try {
      final request = http.MultipartRequest(
        'PUT',
        Uri.http(host, "/api/v1/user"),
      );

      request.headers['Authorization'] = 'Bearer $authToken';
      if (email != null) request.fields['email'] = email;
      if (fullName != null) request.fields['fullName'] = fullName;
      if (password != null) request.fields['password'] = password;
      if (handle != null) request.fields['handle'] = handle;
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
      final response = await http.get(Uri.http(host, "/api/v1/user/id/$userId"),
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
      final response = await http.delete(Uri.http(host, "/api/v1/user"),
          headers: {'Authorization': 'Bearer $authToken'});

      final apiResponse = APIResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.status != 'success') throw apiResponse;
    } on Exception {
      throw APIResponse.serverConnectionError;
    }
  }
}
