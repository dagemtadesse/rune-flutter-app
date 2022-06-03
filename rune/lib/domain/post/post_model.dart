import 'package:equatable/equatable.dart';
import 'package:rune/domain/models.dart';

class Post extends Equatable {
  final int id;
  final int authorId;
  final int channelId;
  final String title;
  final String content;
  final String? image;
  final DateTime updatedAt;
  final int upVote;
  final int downVote;
  final String vote;

  late User author;
  late Channel channel;

  Post(
      {required this.id,
      required this.authorId,
      required this.channelId,
      required this.title,
      required this.content,
      required this.image,
      required this.updatedAt,
      required this.upVote,
      required this.downVote,
      required this.vote});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        authorId: json['authorId'],
        channelId: json['channelId'],
        title: json['title'],
        content: json['text'],
        image: json['mediaUrl'],
        updatedAt: DateTime.parse(json['updatedAt']),
        upVote: json['upVote'] ?? 0,
        downVote: json['downVote'] ?? 0,
        vote: json['vote'] ?? "NONE");
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
        'channelId': channelId,
        'title': title,
        'content': content,
        'image': image,
        'updatedAt': updatedAt,
        'upVote': upVote,
        'downVote': downVote,
        'vote': vote
      };

  @override
  List<Object?> get props => [
        id,
        authorId,
        channelId,
        title,
        content,
        image,
        updatedAt,
        upVote,
        downVote,
        vote
      ];
}
