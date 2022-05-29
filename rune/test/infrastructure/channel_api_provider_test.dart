import 'dart:io';

import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/channel/channel_api_provider.dart';
import 'package:rune/infrastructure/user/user_api_provider.dart';
import 'package:test/test.dart';

void main() {
  final userAPIProvider = UserAPIProvider("http://localhost:9999/api/v1");
  final channelAPIProvider = ChannelAPIProvider("localhost:9999");
  late User user;
  late Channel channel;

  group('Channel API Provider test', () {
    setUpAll(() async {
      user = await userAPIProvider.login('ben@mail.com', 'Ben#mail.com');
    });

    test('Should fetch channels', () async {
      final channels = await channelAPIProvider.fetchChannels(user: user);

      expect(channels, isList);
    });

    test('Should fetch a channel', () async {
      final channels = await channelAPIProvider.fetchChannels(user: user);
      final channel =
          await channelAPIProvider.fetchChannel(user, channels.first.id);

      expect(channels.first.id, channel.id);
    });

    test('Should create a channel', () async {
      channel = await channelAPIProvider.createChannel(user,
          name: "Super Unique Name",
          description: "this is legit super channel",
          email: 'super@mail.com');

      expect(channel, isNot(null));
    });

    test('Should update a channel', () async {
      // print(Directory.current.path);
      final updatedChannel = await channelAPIProvider.updateChannel(
        user,
        channel.id,
        name: "Even cooler name",
        imagePath: 'test_resources/images.jpeg',
      );

      expect(updatedChannel.name, "Even cooler name");
      expect(updatedChannel.id, channel.id);
    });

    test('Should pin a channel', () async {
      await channelAPIProvider.pinChannel(user, channel.id);

      final pinnedChannel =
          await channelAPIProvider.fetchChannel(user, channel.id);
      expect(pinnedChannel.pinned, true);
    });

    test('Should unpin a channel', () async {
      await channelAPIProvider.pinChannel(user, channel.id, reverse: true);

      final pinnedChannel =
          await channelAPIProvider.fetchChannel(user, channel.id);
      expect(pinnedChannel.pinned, false);
    });

    test('Should delete a channel', () async {
      final deletedChannel =
          await channelAPIProvider.deleteChannel(user, channel.id);

      expect(channel.id, deletedChannel.id);
    });
  });
}
