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

  Future<void> addChannel(Channel channel) async {
    final map = channel.toJson();
    await db.insert('channels', map);
  }

  Future<void> updateChannel(Channel channel) async {
    await db.update('channels', channel.toJson());
  }

  Future<List<Channel>> getChannels(int channelId) async {
    final maps = await db.fetchRows('channels');

    return maps.map((channel) => Channel.fromJson(channel)).toList();
  }
}
