import 'package:rune/models/network/user_requests.dart';
import 'package:rune/models/validators/user_validator.dart';

const BASE_URL = "http://192.168.12.1:9999/api/v1";

class User with UserRequest {
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
}
