import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rune/domain/comment/comment_model.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentLoading()) {
    on<LoadComments>(_onLoadComments);
    on<AddComment>(_onAddComment);
    on<DeleteComment>(_onDeleteComment);
  }

  void _onLoadComments(LoadComments event, Emitter<CommentState> emit) async {
    await (Future.delayed(const Duration(seconds: 1)));
    emit(CommentLoaded(comments: event.comments));
  }

  void _onAddComment(AddComment event, Emitter<CommentState> emit) {
    final state = this.state;

    if (state is CommentLoaded) {
      emit(CommentLoaded(
          comments: List.from(state.comments)..add(event.comment)));
    }
  }

  void _onDeleteComment(DeleteComment event, Emitter<CommentState> emit) {
    final state = this.state;

    if (state is CommentLoaded) {
      emit(CommentLoaded(
          comments: List.from(state.comments)..remove(event.comment)));
    }
  }
}
