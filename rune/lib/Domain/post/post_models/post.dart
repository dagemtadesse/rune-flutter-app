import 'package:rune/Domain/user/user_models/user.dart';

// import 'models.dart';

class Post {
  final String postTitle;
  final String postContent;
  final String? postImage;
  // TODO: change this
  final User publisher;
  final DateTime datePublished;

  Post(
      {this.postImage,
      required this.postTitle,
      required this.postContent,
      required this.publisher,
      required this.datePublished});
}
