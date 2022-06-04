part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class LoadComments extends CommentEvent {
  final List<Comment> comments;

  const LoadComments({required this.comments});
  @override
  List<Object> get props => [comments];
}

class AddComment extends CommentEvent {
  final Comment comment;
  const AddComment({required this.comment});

  @override
  List<Object> get props => [comment];
}

class DeleteComment extends CommentEvent {
  final Comment comment;
  const DeleteComment({required this.comment});

  @override
  List<Object> get props => [comment];
}
