import 'dart:math';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  late final int _id;
  final String fullName;
  final String? handle;
  final String email;
  final String? avatar;
  final DateTime updatedAt;
  String? token;

  int get id => _id;

  User(
      {int? id,
      required this.fullName,
      required this.email,
      required this.updatedAt,
      this.handle,
      this.avatar,
      this.token}) {
    _id = id ?? Random.secure().nextInt(1000);
  }

  factory User.fromJson(
    Map<String, dynamic> json,
  ) {
    return User(
        id: json['id'],
        fullName: json['fullname'],
        handle: json['handle'],
        email: json['email'],
        avatar: json['avatar'],
        updatedAt: DateTime.parse(json['updatedAt']),
        token: json['authenticationToken']);
  }

  Map<String, dynamic> toJson() =>
      {'id': _id, 'fullName': fullName, 'email': email, 'updatedAt': updatedAt};

  @override
  List<Object?> get props =>
      [_id, fullName, email, updatedAt, handle, avatar, token];
}
