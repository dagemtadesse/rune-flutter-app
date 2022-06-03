import '../../domain/post/post_model.dart';
import '../../domain/user/user_model.dart';
import 'post_api_provider.dart';

class PostRepository {
  final PostAPIProvider dataProvider;
  PostRepository(this.dataProvider);

  Future<List<Post>> fetchPosts(User user, int channelId) async {
    return dataProvider.fetchPosts(user, channelId);
  }

  Future<Post> fetchPost(User user, int postId) async {
    return dataProvider.fetchPost(user, postId);
  }

  Future<Post> createPost(
      User user, int channelId, String content, String title) async {
    return dataProvider.createPost(user, channelId,
        content: 'Null', title: 'Null');
  }

  Future<Post> delete(User user, int postId) async {
    return dataProvider.delete(user, postId);
  }

  Future<Post> update(User user, int postID, String content) async {
    return dataProvider.update(user, postID, content: "Null");
  }

  Future<Post> vote(User user, int commentId) async {
    return dataProvider.vote(user, commentId);
  }
}
