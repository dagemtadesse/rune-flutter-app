import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String fullName;
  final String? handle;
  final String email;
  final String? avatar;
  final DateTime updatedAt;
  String? token;

  User(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.updatedAt,
      this.handle,
      this.avatar,
      this.token});

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
      {'id': id, 'fullName': fullName, 'email': email, 'updatedAt': updatedAt};

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
