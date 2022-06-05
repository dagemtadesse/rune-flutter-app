import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/api_response.dart';
import 'package:rune/infrastructure/cache_provider.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'dart:developer' as developer;

import 'data_provider/comment_api_provider.dart';
import 'data_provider/comment_cache_provider.dart';

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
        commentCacheProvider.addPost(comment);
      }
      return Expect(comments, null);
    } catch (error) {
      developer.log("$error");
      return Expect(
          null, resolveErrorMessage(error, "Unable to load comments"));
    }
  }

  Future<Expect<Comment>> addComment(
      UserRepository userRepository, int postId, String content) async {
    try {
      final comment = await commentAPIProvider.createComment(
          userRepository.loggedInUser, postId, content);
      commentCacheProvider.addPost(comment);
      return Expect(comment, null);
    } catch (error) {
      return Expect(
          null, resolveErrorMessage(error, "Unable to send the comment"));
    }
  }

  Future<Expect<Comment>> voteComment(
      UserRepository userRepository, int commentId, String type) async {
    try {
      final updated = await commentAPIProvider
          .vote(userRepository.loggedInUser, commentId, action: type);
      commentCacheProvider.updateComments(updated);
      return Expect(updated, null);
    } catch (error, stackTrace) {
      developer.log("$error", stackTrace: stackTrace);
      return Expect(
          null, resolveErrorMessage(error, "Unable to vote the post"));
    }
  }
}
