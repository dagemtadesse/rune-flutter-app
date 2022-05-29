import 'package:rune/domain/models.dart';

class Comment {
  final int id;
  final int authorId;
  final int postId;
  final String content;
  final DateTime updatedAt;
  final int upVote;
  final int downVote;

  late User author;
  late Post post;

  Comment(
      {required this.id,
      required this.authorId,
      required this.postId,
      required this.content,
      required this.updatedAt,
      required this.upVote,
      required this.downVote});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      authorId: json['authorId'],
      postId: json['postId'],
      content: json['content'],
      updatedAt: DateTime.parse(json['updatedAt']),
      upVote: json['upVote'] ?? 0,
      downVote: json['downVote'] ?? 0,
    );
  }
}
