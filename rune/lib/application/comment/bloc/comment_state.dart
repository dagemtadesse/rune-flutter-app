part of 'comment_bloc.dart';

@immutable
abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentLoading extends CommentState {}

class CommentLoadingSucceded extends CommentState {
  final List<Comment> comments;

  const CommentLoadingSucceded({required this.comments});
  @override
  List<Object> get props => [comments];
}

class CommentLoadingFailed extends CommentState {
  final String message;

  CommentLoadingFailed(this.message);
}

class CommentAddSuccessfuly extends CommentState {}
