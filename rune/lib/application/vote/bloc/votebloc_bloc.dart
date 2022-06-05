import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;
import 'package:rune/infrastructure/repositories.dart';

part 'votebloc_event.dart';
part 'votebloc_state.dart';

class VoteBloc<T> extends Bloc<VoteEvent, VoteState> {
  final PostRepository postRepository;
  final UserRepository userRepository;
  final CommentRepository commentRepository;

  VoteBloc(
    this.postRepository,
    this.userRepository,
    this.commentRepository,
    initialState,
  ) : super(initialState) {
    on<Vote>((Vote event, emit) async {
      if (event.artifactType == "post") {
        final voted = await postRepository.votePost(
            userRepository, event.artifact.id, event.type);

        if (!voted.hasError) {
          emit(Voted(voted.data));
        }
      } else {
        final voted = await commentRepository.voteComment(
            userRepository, event.artifact.id, event.type);

        if (!voted.hasError) {
          developer.log("${event.artifact}");
          emit(Voted(voted.data));
        }
        // developer.
      }
    });
  }
}
