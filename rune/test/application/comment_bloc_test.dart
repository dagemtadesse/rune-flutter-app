import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/application/comment/bloc/comment_bloc.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';

class MockCommentRepository extends Mock implements CommentRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockCommentRepository mockCommentRepository;
  late MockUserRepository mockUserRepository;
  mockUserRepository = MockUserRepository();

  setUp(() {
    mockCommentRepository = MockCommentRepository();
  });

  group('LoadComments', () {
    final comment = Comment(
        id: 1,
        authorId: 2,
        postId: 3,
        content: "hello World",
        updatedAt: DateTime.now(),
        upVote: 2,
        downVote: 7,
        vote: "");

    test(
        'emits states: commentsLoading -> commentLoadingSuceeded, when sucessful',
        () {
      when(mockCommentRepository
          .fetchComments(mockUserRepository, comment.postId)
          .then((_) async => comment));
    });

    final commentBloc = CommentBloc(mockCommentRepository, mockUserRepository);
    commentBloc.add(LoadComments(comment.postId));

    expectLater(commentBloc,
        emitsInOrder([CommentLoading(), CommentLoadingSucceded(comments: [])]));
    // TO DO : fix the comments: []
  });
}
