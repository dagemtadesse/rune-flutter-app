import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/channel/channel_api_provider.dart';
import 'package:rune/infrastructure/post/post_api_provider.dart';
import 'package:rune/infrastructure/user/user_api_provider.dart';
import 'package:test/test.dart';

void main() {
  final userAPIProvider = UserAPIProvider("http://localhost:9999/api/v1");
  final channelAPIProvider = ChannelAPIProvider("localhost:9999");
  final postAPIProvider = PostAPIProvider('localhost:9999');

  late User user;
  late Channel channel;
  late Post newPost;

  group('Post API Provider test', () {
    setUpAll(() async {
      user = await userAPIProvider.login('ben@mail.com', 'Ben#mail.com');
      channel = await channelAPIProvider.createChannel(user,
          name: "graden gnome",
          description: "this is legit super channel",
          email: 'super@mail.com');
    });

    tearDownAll(() async {
      await channelAPIProvider.deleteChannel(user, channel.id);
    });
    test('Should create a post', () async {
      newPost = await postAPIProvider.createPost(user, channel.id,
          title: "I'm having a head ache",
          content: "How could someone be so dump");
      expect(newPost.channelId, channel.id);
    });
    test('Should fetch post', () async {
      final fetchedPost = await postAPIProvider.fetchPost(user, newPost.id);

      expect(fetchedPost.id, newPost.id);
    });
    test('Should fetch posts in a channel', () async {
      final posts = await postAPIProvider.fetchPosts(user, channel.id);

      expect(posts, isList);
    });

    test('Should update post', () async {
      final updated = await postAPIProvider.update(user, newPost.id,
          title: "Dagem is tired",
          content: "He need water",
          imagePath: 'test_resources/images.jpeg');

      expect(updated.id, newPost.id);
    });
    test('Should vote post', () async {
      var updated =
          await postAPIProvider.vote(user, newPost.id, action: "UP_VOTE");

      expect(updated.vote, "UP_VOTE");

      updated =
          await postAPIProvider.vote(user, newPost.id, action: "DOWN_VOTE");

      expect(updated.vote, "DOWN_VOTE");

      updated = await postAPIProvider.vote(
        user,
        newPost.id,
      );

      expect(updated.vote, "NONE");
    });

    test('Should delete post', () async {
      final deletedPost = await postAPIProvider.delete(user, newPost.id);

      expect(deletedPost.id, newPost.id);
    });
  });
}
