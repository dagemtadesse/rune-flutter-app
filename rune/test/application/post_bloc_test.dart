import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';

class MockPostRepository extends Mock implements PostRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockPostRepository mockPostRepository;
  late MockUserRepository mockUserRepository;
  mockUserRepository = MockUserRepository();

  setUp(() {
    mockPostRepository = MockPostRepository();
  });

  group('LoadPosts', () {
    final post = Post(
        id: 1,
        authorId: 3,
        channelId: 7,
        title: "",
        content: '',
        image: '',
        updatedAt: DateTime.now(),
        upVote: 4,
        downVote: 4,
        vote: '');

    test('emits states: LoadingPosts -> LoadingPostSuceeded, when sucessful',
        () {
      when(mockPostRepository
          .getPosts(mockUserRepository, post.channelId, 1)
          .then((_) async => post));
    });

    final postBloc = PostBloc(mockPostRepository, mockUserRepository);
    postBloc.add(LoadChannelsPosts(post.channelId));

    expectLater(
        postBloc, emitsInOrder([LoadingPosts(), LoadingPostsSucced([])]));
    // TO DO : fix LoadingpostSucced[]
  });
}
