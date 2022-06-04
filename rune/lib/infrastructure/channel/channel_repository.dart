import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/api_response.dart';
import 'package:rune/infrastructure/channel/channel_api_provider.dart';

class ChannelRepository {
  final channelAPIProvider = ChannelAPIProvider('localhost:9999');

  Future<Expect<List<Channel>>> getChannels(
      {required User user,
      int size = 12,
      int page = 0,
      String query = " ",
      String onlyBookmarked = ""}) async {
    try {
      final channels = await channelAPIProvider.fetchChannels(
          user: user, size: size, query: query, onlyBookmarked: onlyBookmarked);
      return Expect(channels, null);
    } catch (error) {
      var message = "Unable to Fetch channels";
      if (error is APIResponse && error.message != null) {
        message = error.message!;
      } else if (error is String) {
        message = error;
      }

      return Expect(null, message);
    }
  }

  Future<Expect<Channel>> getChannel(
      {required User user, required int channelId}) async {
    try {
      final channel = await channelAPIProvider.fetchChannel(user, channelId);
      return Expect(channel, null);
    } catch (error) {
      var message = "Unable to Fetch the channel";
      if (error is APIResponse && error.message != null) {
        message = error.message!;
      } else if (error is String) {
        message = error;
      }

      return Expect(null, message);
    }
  }

  Future<Expect<Channel>> pinChannel(
      {required User user, required int channelId}) async {
    try {
      final channel = await channelAPIProvider.fetchChannel(user, channelId);
      return Expect(channel, null);
    } catch (error) {
      var message = "Unable to pin the channel";
      if (error is APIResponse && error.message != null) {
        message = error.message!;
      } else if (error is String) {
        message = error;
      }

      return Expect(null, message);
    }
  }

  Future<Expect<bool>> removeChannel(
      {required User user, required int channelId}) async {
    try {
      await channelAPIProvider.deleteChannel(user, channelId);
      return Expect(true, null);
    } catch (error) {
      var message = "Unable to remove the channel";
      if (error is APIResponse && error.message != null) {
        message = error.message!;
      } else if (error is String) {
        message = error;
      }

      return Expect(null, message);
    }
  }
}
