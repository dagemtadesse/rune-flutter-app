import 'package:rune/models/network/user_requests.dart';

enum Role { admin, user }

class User with UserRequest {
  final int id;
  final String fullName;
  final String? handle;
  final String email;
  final String? avatar;
  final Role role;
  String? authToken;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    this.handle,
    this.avatar,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullname'],
        email = json['email'],
        handle = json['handle'],
        avatar = json['avatar'],
        role = json['role'] == 'USER' ? Role.user : Role.admin;
}
