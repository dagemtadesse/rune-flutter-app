part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class LoadComments extends CommentEvent {
  final int postId;

  LoadComments(this.postId);
}

class AddComment extends CommentEvent {
  final String comment;
  final int postId;

  const AddComment(this.postId, {required this.comment});

  @override
  List<Object> get props => [comment];
}

class DeleteComment extends CommentEvent {
  final Comment comment;
  const DeleteComment({required this.comment});

  @override
  List<Object> get props => [comment];
}
