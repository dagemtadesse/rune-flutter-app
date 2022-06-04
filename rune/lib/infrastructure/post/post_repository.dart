import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/api_response.dart';
import 'package:rune/infrastructure/post/post_api_provider.dart';
import 'package:rune/infrastructure/repositories.dart';

class PostRepository {
  final postAPIProvider = PostAPIProvider("localhost:9999");

  Future<Expect<List<Post>>> getPosts(
      UserRepository userRepository, int chanId, int page,
      [int size = 12]) async {
    try {
      final posts = await postAPIProvider.fetchPosts(
        userRepository.loggedInUser!,
        chanId,
        page: page,
        size: size,
      );

      // for (var post in posts) {
      //   post.author = userRepository.getUser(post.authorId);
      // }

      return Expect(posts, null);
    } catch (error) {
      var message = "Unable to Fetch posts";
      if (error is APIResponse && error.message != null) {
        message = error.message!;
      } else if (error is String) {
        message = error;
      }

      return Expect(null, message);
    }
  }
}
