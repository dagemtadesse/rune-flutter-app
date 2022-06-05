import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'package:rune/main.dart';
import 'comment_repo_test.mocks.dart';

class CommentRepoTest extends Mock implements CommentRepo {}

@GenerateMocks([CommentRepoTest])
Future<void> main() async {
  late MockCommentRepoTest commentRepo;

  setUpAll(() {
    commentRepo = MockCommentRepoTest();
  });

  final comment = Comment(
      id: 2,
      authorId: 13,
      postId: 11,
      content: "comment about exam rescheduling",
      updatedAt: DateTime.now(),
      upVote: 33,
      downVote: 23,
      vote: "voted");
  final commentList = [comment];
  final userRepository = UserRepository(database, host);
  final postId = 12;

  group('comment repo test', () {

    //test fetchComment()
    test('test fetchcomment', () async {
      when(commentRepo.fetchComments(userRepository, postId))
          .thenAnswer((_) async {
        return Expect(commentList, null);
      });

      final res = await commentRepo.fetchComments(userRepository, postId);

      expect(res, isA<Expect<List<Comment>>>());
    });

    //test fetchComment() exception
    test('test fetchComment throws Exception', () {
      when(commentRepo.fetchComments(userRepository, postId))
          .thenAnswer((_) async {
        throw Exception();
      });

      final res = commentRepo.fetchComments(userRepository, postId);

      expect(res, throwsException);
    });

    //test addComment()
    test('test addComment', () async {
      when(commentRepo.addComment(userRepository,postId,comment.content))
          .thenAnswer((_) async {
        return Expect(comment, null);
      });

      final res = await commentRepo.addComment(userRepository,postId,comment.content);

      expect(res, isA<Expect<Comment>>());
    });

    //test addComment() exception
    test('test addComment throws Exception', () {
      when(commentRepo.addComment(userRepository,postId,comment.content))
          .thenAnswer((_) async {
        throw Exception();
      });

      final res = commentRepo.addComment(userRepository,postId,comment.content);

      expect(res, throwsException);
    });

    //test voteComment()
    test('test voteComment', () async {
      when(commentRepo.voteComment(userRepository,postId,comment.content))
          .thenAnswer((_) async {
        return Expect(comment, null);
      });

      final res = await commentRepo.voteComment(userRepository,postId,comment.content);

      expect(res, isA<Expect<Comment>>());
    });

    //test voteComment() exception
    test('test voteComment throws Exception', () {
      when(commentRepo.voteComment(userRepository,postId,comment.content))
          .thenAnswer((_) async {
        throw Exception();
      });

      final res = commentRepo.voteComment(userRepository,postId,comment.content);

      expect(res, throwsException);
    });
  });
}
