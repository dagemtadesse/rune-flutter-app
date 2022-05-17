import 'package:rune/models/network/user_requests.dart';

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
      this.handle,
      required this.email,
      this.avatar,
      this.mimeType});

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
