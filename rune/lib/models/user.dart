import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rune/models/validators/user_validator.dart';

const BASE_URL = "http://localhost:9099/api/v1/";

class User extends UserValidator {
  final int id;
  final String fullName;
  final String? handle;
  final String email;
  final String? avatar;
  final String? mimeType;
  String? authToken;

  User(
      {required this.id,
      required this.fullName,
      required this.handle,
      required this.email,
      required this.avatar,
      required this.mimeType});

  factory User.fromJson(
    Map<String, dynamic> json,
  ) {
    return User(
        id: json['id'],
        fullName: json['fullname'],
        handle: json['handle'],
        email: json['email'],
        avatar: json['avatar'],
        mimeType: json['mimeType']);
  }

  static Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$BASE_URL/auth-token"),
      body: {'email': email, 'password': password},
    );

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return User.fromJson(body["data"]);
    }

    throw UnimplementedError();
  }

  static Future<User> register(
      String fullName, String email, String password) async {
    final response = await http.post(Uri.parse("$BASE_URL/user"),
        body: {'fullname': fullName, 'email': email, 'password': password});

    final jsonBody = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return User.fromJson(jsonBody["data"]);
    }

    throw UnimplementedError();
  }
}
