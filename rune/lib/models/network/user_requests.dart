// import 'package:http/http.dart';

import '../models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRequest {
  static Future<User> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$BASE_URL/auth-token"),
        body: {'email': email, 'password': password},
      );
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return User.fromJson(body["data"]);
      }

      throw body['message'];
    } on Exception {
      throw "Unable to connect to the server";
    }
  }

  static Future<User> register(
      String fullName, String email, String password) async {
    try {
      final response = await http.post(Uri.parse("$BASE_URL/user"),
          body: {'fullname': fullName, 'email': email, 'password': password});

      final jsonBody = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return User.fromJson(jsonBody["data"]);
      }

      throw {jsonBody['message']};
    } on Exception {
      throw "Unable to connect to the server";
    }
  }
}
