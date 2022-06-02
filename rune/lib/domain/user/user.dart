class User {
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
}
