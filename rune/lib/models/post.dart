import 'models.dart';

class Post {
  final int id;
  final int authorId;
  final int channelId;
  final String title;
  final String text;
  final String? mediaUrl;
  final int upVote;
  final int downVote;
  String vote;
  late User author;

  final DateTime createdAt;

  Post(
      {required this.title,
      required this.text,
      required this.mediaUrl,
      required this.upVote,
      required this.downVote,
      required this.createdAt,
      required this.id,
      required this.authorId,
      required this.channelId,
      required this.vote});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        text = json['text'],
        mediaUrl = json['mediaUrl'],
        upVote = json['upVote'],
        createdAt = DateTime.parse(json['createdAt']),
        vote = json['vote'],
        downVote = json['downVote'],
        authorId = json['authorId'],
        channelId = json['channelId'];
}

typedef Posts = List<Post>;
