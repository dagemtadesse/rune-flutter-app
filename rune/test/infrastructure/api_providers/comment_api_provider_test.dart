import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/channel/data_provider/channel_api_provider.dart';
import 'package:rune/infrastructure/comment/data_provider/comment_api_provider.dart';
import 'package:rune/infrastructure/post/data_provider/post_api_provider.dart';
import 'package:rune/infrastructure/user/data_provider/user_api_provider.dart';
import 'package:test/test.dart';

void main() {
  final userAPIProvider = UserAPIProvider("http://localhost:9999/api/v1");
  final channelAPIProvider = ChannelAPIProvider("localhost:9999");
  final postAPIProvider = PostAPIProvider('localhost:9999');
  final commentAPIProvider = CommentAPIProvider('localhost:9999');

  late User user;
  late Channel channel;
  late Post newPost;
  late Comment newComment;

  group('Comment API provider', () {
    setUpAll(() async {
      user = await userAPIProvider.login('ben@mail.com', 'Ben#mail.com');
      channel = await channelAPIProvider.createChannel(user,
          name: "TestChannel123",
          description: "this is legit super channel",
          email: 'testcahnnel12@mail.com');
      newPost = await postAPIProvider.createPost(user, channel.id,
          title: "I'm having a head ache",
          content: "How could someone be so dump");
    });

    tearDownAll(() async {
      await postAPIProvider.delete(user, newPost.id);
      await channelAPIProvider.deleteChannel(user, channel.id);
    });

    test('Should create a comment', () async {
      newComment = await commentAPIProvider.createComment(
          user, newPost.id, "This is test comment");

      expect(newComment.postId, newPost.id);
    });

    test('Should update comment', () async {
      final update = await commentAPIProvider.update(
          user, newComment.id, "This is updated comment");
      expect(update.id, newComment.id);
    });

    test('Should fetch comment', () async {
      final fetched =
          await commentAPIProvider.fetchComment(user, newComment.id);
      expect(fetched.id, newComment.id);
    });

    test('Should fetch comments', () async {
      final fetched = await commentAPIProvider.fetchComments(user, newPost.id);
      expect(fetched, isList);
    });

    test('Should delete comment', () async {
      final deleted = await commentAPIProvider.delete(user, newComment.id);
      expect(deleted.id, newComment.id);
    });
  });
}
