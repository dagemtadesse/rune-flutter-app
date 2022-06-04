import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/cache_provider.dart';

class PostCacheProvider {
  final CacheDatabase db;

  PostCacheProvider(this.db);

  Future<User?> getPost(int id) async {
    final mapped = await db.getRow('posts', id);

    if (mapped.isEmpty) {
      return null;
    }
    return User.fromJson(mapped.first);
  }

  Future<void> removePost(int id) async {
    await db.delete('posts', id);
  }

  Future<void> addPost(Post post) async {
    final map = post.toJson();
    await db.insert('posts', map);
  }

  Future<void> updatePosts(Post post) async {
    await db.update('posts', post.toJson());
  }

  Future<List<Post>> getPosts(int channelId) async {
    final maps = await db.fetchRows('posts');

    return maps.map((post) => Post.fromJson(post)).toList();
  }
}
