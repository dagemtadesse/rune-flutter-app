import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/api_response.dart';
import 'package:rune/infrastructure/cache_provider.dart';
import 'dart:developer' as developer;

import 'package:rune/infrastructure/repositories.dart';
import 'data_provider/channel_api_provider.dart';
import 'data_provider/channel_cache_provider.dart';

abstract class ChannelRepo {
  Future<Expect<List<Channel>>> getChannels(
      {required User user,
      int size,
      int page,
      String query,
      String onlyBookmarked});

  Future<Expect<Channel>> getChannel(
      {required User user, required int channelId});

  Future<Expect<Channel>> pinChannel(
      {required User user, required int channelId});

  Future<Expect<bool>> removeChannel(
      {required User user, required int channelId});

  Future<Expect<Channel>> createChannel(UserRepository userRepository,
      String name, String description, String location, String email);
}

class ChannelRepository extends ChannelRepo {
  final ChannelAPIProvider channelAPIProvider;
  final ChannelCacheProvider channelCacheProvider;

  ChannelRepository(CacheDatabase database, String host)
      : channelCacheProvider = ChannelCacheProvider(database),
        channelAPIProvider = ChannelAPIProvider(host);

  Future<Expect<List<Channel>>> getChannels(
      {required User user,
      int size = 12,
      int page = 0,
      String query = " ",
      String onlyBookmarked = ""}) async {
    try {
      developer.log("request sent");
      final channels = await channelAPIProvider.fetchChannels(
          user: user, size: size, query: query, onlyBookmarked: onlyBookmarked);
      for (final channel in channels) {
        channelCacheProvider.addChannel(channel);
      }
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
      channelCacheProvider.addChannel(channel);
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
      {required User user, required int channelId, bool unpin = false}) async {
    try {
      final channel =
          await channelAPIProvider.pinChannel(user, channelId, reverse: unpin);
      return Expect(channel, null);
    } catch (error) {
      developer.log("$error");
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

  Future<Expect<Channel>> createChannel(UserRepository userRepository,
      String name, String description, String location, String email) async {
    try {
      final channel = await channelAPIProvider.createChannel(
          userRepository.loggedInUser,
          name: name,
          description: description,
          email: email);
      return Expect(channel, null);
    } catch (error) {
      return Expect(
          null, resolveErrorMessage(error, "Unable to create channel"));
    }
  }
}
