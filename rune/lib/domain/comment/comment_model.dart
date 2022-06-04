import 'package:equatable/equatable.dart';
import 'package:rune/domain/models.dart';

class Comment extends Equatable {
  final int id;
  final int authorId;
  final int postId;
  final String content;
  final DateTime updatedAt;
  final int upVote;
  final int downVote;
  final String vote;

  late User author;
  late Post post;

  Comment(
      {required this.id,
      required this.authorId,
      required this.postId,
      required this.content,
      required this.updatedAt,
      required this.upVote,
      required this.downVote,
      required this.vote});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        id: json['id'],
        authorId: json['authorId'],
        postId: json['postId'],
        content: json['content'],
        updatedAt: DateTime.parse(json['updatedAt']),
        upVote: json['upVote'] ?? 0,
        downVote: json['downVote'] ?? 0,
        vote: json['vote'] ?? 'NONE');
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
        'postId': postId,
        'content': content,
        'updatedAt': updatedAt,
        'upVote': upVote,
        'downVote': downVote,
        'vote': vote
      };

  @override
  List<Object?> get props =>
      [id, authorId, postId, content, updatedAt, upVote, downVote];
}
