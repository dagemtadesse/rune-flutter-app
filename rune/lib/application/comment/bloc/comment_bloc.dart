import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rune/domain/comment/comment_model.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentLoading()) {
    on<LoadComments>(_onLoadComments);
    // on<AddComment>(_onAddComment);
    // on<DeleteComment>(_onDeleteComment);
  }

  void _onLoadComments(LoadComments event, Emitter emit) async {
    await (Future.delayed(const Duration(seconds: 1)));
    emit(CommentLoaded(comments: event.comments));
  }

  void _onAddComment(LoadComments event, Emitter emit) {
    final state = this.state;

    if (state is CommentLoaded) {}
  }

  void _onDeleteComment(LoadComments event, Emitter emit) {}
}
