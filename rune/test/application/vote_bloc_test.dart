import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/application/vote/bloc/votebloc_bloc.dart';
import 'package:rune/infrastructure/repositories.dart';

class MockVoteRepository extends Mock
    implements PostRepository, CommentRepository, UserRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockVoteRepository mockVoteRepository;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockVoteRepository = MockVoteRepository();

    mockUserRepository = MockUserRepository();
  });

  group('Vote', () {
    test('emits state: Voted(), when sucessful', () {
      when(mockVoteRepository.votePost(mockUserRepository, 3, ''));
    });

    final voteBloc = VoteBloc(
        mockVoteRepository, mockVoteRepository, mockVoteRepository, '');
    voteBloc.add(Vote('', ''));

    expectLater(voteBloc, emits([Voted('')]));
  });
}
