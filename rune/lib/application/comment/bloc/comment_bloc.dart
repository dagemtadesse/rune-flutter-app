import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rune/domain/comment/comment_model.dart';
import 'package:rune/infrastructure/repositories.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository;
  final UserRepository userRepository;

  CommentBloc(this.commentRepository, this.userRepository)
      : super(CommentLoading()) {
    on<LoadComments>(_onLoadComments);
    on<AddComment>(_onAddComment);
    on<DeleteComment>(_onDeleteComment);
  }

  void _onLoadComments(LoadComments event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    final data =
        await commentRepository.fetchComments(userRepository, event.postId);
    if (data.hasError) {
      emit(CommentLoadingFailed("Unable to load comments"));
      return;
    }

    emit(CommentLoadingSucceded(comments: data.data));
  }

  void _onAddComment(AddComment event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    final data = await commentRepository.addComment(
        userRepository, event.postId, event.comment);
    if (data.hasError) {
      emit(CommentLoadingFailed("Unable to load comments"));
      return;
    }

    emit(CommentAddSuccessfuly());
  }

  void _onDeleteComment(DeleteComment event, Emitter<CommentState> emit) {
    final state = this.state;

    if (state is CommentLoadingSucceded) {
      emit(CommentLoadingSucceded(
          comments: List.from(state.comments)..remove(event.comment)));
    }
  }
}
