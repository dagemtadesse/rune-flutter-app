import 'package:rune/domain/models.dart';

class Channel {
  final int id;
  final int authorId;
  final String name;
  final String description;
  final String? address;
  final DateTime createdAt;
  final String? email;
  final String? logo;
  final bool pinned;
  final bool verified;
  late User author;

  Channel(
      {required this.id,
      required this.authorId,
      required this.name,
      required this.description,
      required this.verified,
      required this.createdAt,
      required this.pinned,
      this.address,
      this.email,
      this.logo});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
        id: json['id'],
        authorId: json['authorId'],
        name: json['name'],
        description: json['description'],
        createdAt: DateTime.parse(json['createAt']),
        pinned: json['pinned'] ?? false,
        verified: json['verified']);
  }
}