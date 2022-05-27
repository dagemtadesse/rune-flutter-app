import 'package:rune/models/providers/provider.dart';

import '../models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'network.dart';

// ignore: constant_identifier_names
const BASE_URL = "http://localhost:9999/api/v1";

Future<User> fetchUser(Repository repo, int userId) async {
  try {
    final response = await http.get(
      Uri.parse("${Repository.baseUrl}/user/id/$userId"),
      headers: {'Authorization': "Bearer ${repo.authenticationKey}"},
    );
    final apiResponse = APIResponse.fromJson(jsonDecode(response.body));

    if (apiResponse.statusCode != 200) {
      throw apiResponse;
    }

    return User.fromJson(apiResponse.data);
  } on Exception {
    throw connectionError;
  }
}

Future<Post> votePost(Repository repo, int postId, String reaction) async {
  try {
    final response = await http.post(
      Uri.parse(Repository.baseUrl + "/$reaction/posts/$postId"),
      headers: {'Authorization': "Bearer ${repo.authenticationKey}"},
    );
    final apiResponse = APIResponse.fromJson(jsonDecode(response.body));

    if (apiResponse.statusCode != 200) {
      throw apiResponse;
    }

    return Post.fromJson(apiResponse.data as Map<String, dynamic>);
  } on Exception {
    throw connectionError;
  }
}

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

      throw jsonBody['message'];
    } on Exception {
      throw "Unable to connect to the server";
    }
  }

  static Future<User> changePassword(String oldPassword, String newPassword) {
    throw UnimplementedError();
  }
}
