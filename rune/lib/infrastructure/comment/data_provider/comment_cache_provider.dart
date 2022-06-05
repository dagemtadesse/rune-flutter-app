import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/cache_provider.dart';

class CommentCacheProvider {
  final CacheDatabase db;

  CommentCacheProvider(this.db);

  Future<Comment?> getComment(int id) async {
    final mapped = await db.getRow('comments', id);

    if (mapped.isEmpty) {
      return null;
    }
    return Comment.fromJson(mapped.first);
  }

  Future<void> removeComment(int id) async {
    await db.delete('comments', id);
  }

  Future<void> addPost(Comment comment) async {
    final map = comment.toJson();
    await db.insert('comments', map);
  }

  Future<void> updateComments(Comment comment) async {
    await db.update('comments', comment.toJson());
  }

  Future<List<Comment>> getComments(int commentId) async {
    final maps = await db.fetchRows('comments');

    return maps.map((comment) => Comment.fromJson(comment)).toList();
  }
}
