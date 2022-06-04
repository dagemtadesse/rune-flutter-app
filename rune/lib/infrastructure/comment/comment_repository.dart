import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/api_response.dart';
import 'package:rune/infrastructure/cache_provider.dart';
import 'package:rune/infrastructure/comment/comment_api_provider.dart';
import 'package:rune/infrastructure/comment/comment_cache_provider.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'dart:developer' as developer;

String resolveErrorMessage(dynamic error, String msg, [String? altMsg]) {
  String message = msg;

  if (error is APIResponse && error.message != null) {
    message = error.message!;
    if (error.message!.contains('Database error')) {
      message = altMsg ?? "";
    }
  } else if (error is String) {
    message = error;
  }
  return message;
}

class CommentRepository {
  final CommentAPIProvider commentAPIProvider;
  final CommentCacheProvider commentCacheProvider;

  CommentRepository(CacheDatabase database, String host)
      : commentCacheProvider = CommentCacheProvider(database),
        commentAPIProvider = CommentAPIProvider(host);

  Future<Expect<List<Comment>>> fetchComments(
      UserRepository userRepository, int postId) async {
    try {
      final comments = await commentAPIProvider.fetchComments(
          userRepository.loggedInUser, postId);
      for (final comment in comments) {
        comment.author = (await userRepository.getUser(comment.authorId)).data;
      }
      return Expect(comments, null);
    } catch (error) {
      developer.log("$error");
      return Expect(
          null, resolveErrorMessage(error, "Unable to load comments"));
    }
  }

  Future<Expect<Comment>> addComment(
      UserRepository userRepository, int postId, String comment) async {
    try {
      final comments = await commentAPIProvider.createComment(
          userRepository.loggedInUser, postId, comment);
      return Expect(comments, null);
    } catch (error) {
      return Expect(
          null, resolveErrorMessage(error, "Unable to send the comment"));
    }
  }
}
