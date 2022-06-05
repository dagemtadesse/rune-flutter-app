import 'package:equatable/equatable.dart';
import 'package:rune/domain/models.dart';

class Channel extends Equatable {
  final int id;
  final int authorId;
  final String name;
  final String description;
  final String? address;
  final DateTime updatedAt;
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
      required this.updatedAt,
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
        updatedAt: DateTime.parse(json['updatedAt']),
        pinned: json['pinned'] ?? false,
        verified: json['verified']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
        'name': name,
        'description': description,
        'verified': verified,
        'updatedAt': updatedAt.toString(),
        'pinned': pinned,
        'logo': logo,
        'email': email,
        'address': address
      };

  @override
  List<Object?> get props => [
        id,
        authorId,
        name,
        description,
        verified,
        updatedAt,
        pinned,
        address,
        email,
        logo
      ];
}
