import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/cache_provider.dart';

class ChannelCacheProvider {
  final CacheDatabase db;

  ChannelCacheProvider(this.db);

  Future<Channel?> getChannel(int id) async {
    final mapped = await db.getRow('channels', id);

    if (mapped.isEmpty) {
      return null;
    }
    return Channel.fromJson(mapped.first);
  }

  Future<void> removeChannel(int id) async {
    await db.delete('channels', id);
  }

  Future<void> addChannel(Comment comment) async {
    final map = comment.toJson();
    await db.insert('channels', map);
  }

  Future<void> updateChannel(Comment comment) async {
    await db.update('channels', comment.toJson());
  }

  Future<List<Channel>> getChannels(int commentId) async {
    final maps = await db.fetchRows('comments');

    return maps.map((channel) => Channel.fromJson(channel)).toList();
  }
}
