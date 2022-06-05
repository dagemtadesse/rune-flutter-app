import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/api_response.dart';
import 'package:rune/infrastructure/cache_provider.dart';
import 'package:rune/infrastructure/repositories.dart';

import 'data_provider/post_api_provider.dart';
import 'data_provider/post_cache_provider.dart';

class PostRepository {
  final PostAPIProvider postAPIProvider;
  final PostCacheProvider postCacheProvider;

  PostRepository(CacheDatabase database, String host)
      : postAPIProvider = PostAPIProvider(host),
        postCacheProvider = PostCacheProvider(database);

  Future<Expect<List<Post>>> getPosts(
      UserRepository userRepository, int chanId, int page,
      [int size = 12]) async {
    try {
      final posts = await postAPIProvider.fetchPosts(
        userRepository.loggedInUser,
        chanId,
        page: page,
        size: size,
      );

      for (var post in posts) {
        post.author = (await userRepository.getUser(post.authorId)).data;
        postCacheProvider.addPost(post);
      }

      return Expect(posts, null);
    } catch (error) {
      print(error);
      var message = "Unable to Fetch posts";
      if (error is APIResponse && error.message != null) {
        message = error.message!;
      } else if (error is String) {
        message = error;
      }

      return Expect(null, message);
    }
  }

  Future<Expect<Post>> createPost(UserRepository userRepository, int channelId,
      String title, String content) async {
    try {
      final newPost = await postAPIProvider.createPost(
          userRepository.loggedInUser, channelId,
          title: title, content: content);
      postCacheProvider.addPost(newPost);
      return Expect(newPost, null);
    } catch (error) {
      print(error);
      var message = "Unable to Fetch posts";
      if (error is APIResponse && error.message != null) {
        message = error.message!;
      } else if (error is String) {
        message = error;
      }

      return Expect(null, message);
    }
  }

  Future<Expect<Post>> votePost(
      UserRepository userRepository, int postId, String type) async {
    try {
      final updated = await postAPIProvider
          .vote(userRepository.loggedInUser, postId, action: type);
      postCacheProvider.updatePosts(updated);
      return Expect(updated, null);
    } catch (error) {
      return Expect(
          null, resolveErrorMessage(error, "Unable to vote the post"));
    }
  }
}
