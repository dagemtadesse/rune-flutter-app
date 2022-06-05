import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'package:rune/main.dart';
import 'post_repo_test.mocks.dart';

class PostRepoTest extends Mock implements PostRepo {}

@GenerateMocks([PostRepoTest])
Future<void> main() async {
  late MockPostRepoTest postRepo;

  setUpAll(() {
    postRepo = MockPostRepoTest();
  });

  final post = Post(
      id: 1,
      authorId: 22,
      channelId: 323,
      title: "Final Exam",
      content: "This post is about final exam",
      updatedAt: DateTime.now(),
      upVote: 25,
      image: null,
      downVote: 34,
      vote: "voted");

  final postList = [post];
  final userRepository = UserRepository(database, host);
  final channelId = 55;

  group('post repo test', () {
    //test getPosts()
    test('test getPosts', () async {
      when(postRepo.getPosts(userRepository, channelId, 7))
          .thenAnswer((_) async {
        return Expect(postList, null);
      });

      final res = await postRepo.getPosts(userRepository, channelId, 7);

      expect(res, isA<Expect<List<Post>>>());
    });

    //test getPosts() exception
    test('test getPosts throws Exception', () {
      when(postRepo.getPosts(userRepository, channelId, 7))
          .thenAnswer((_) async {
        throw Exception();
      });

      final res = postRepo.getPosts(userRepository, channelId, 7);

      expect(res, throwsException);
    });

    //test createPost()
    test('test createPosts', () async {
      when(postRepo.createPost(userRepository, channelId, "Final exam",
              "this post is about final exam"))
          .thenAnswer((_) async {
        return Expect(post, null);
      });

      final res = await postRepo.createPost(userRepository, channelId, "Final exam",
              "this post is about final exam");

      expect(res, isA<Expect<Post>>());
    });

    //test createPosts() exception
    test('test createPosts throws Exception', () {
      when(postRepo.createPost(userRepository, channelId, "Final exam",
              "this post is about final exam"))
          .thenAnswer((_) async {
        throw Exception();
      });

      final res = postRepo.createPost(userRepository, channelId, "Final exam",
              "this post is about final exam");

      expect(res, throwsException);
    });

    //test votePost()
    test('test votePost', () async {
      when(postRepo.votePost(userRepository, post.id, "Exam post"))
          .thenAnswer((_) async {
        return Expect(post, null);
      });

      final res = await postRepo.votePost(userRepository, post.id, "Exam post");

      expect(res, isA<Expect<Post>>());
    });

    //test votePost() exception
    test('test votePost throws Exception', () {
      when(postRepo.votePost(userRepository, post.id, "Exam post"))
          .thenAnswer((_) async {
        throw Exception();
      });

      final res = postRepo.votePost(userRepository, post.id, "Exam post");
      expect(res, throwsException);
    });
  });
}
