part of 'comment_bloc.dart';

@immutable
abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<Comment> comments;

  const CommentLoaded({required this.comments});
  @override
  List<Object> get props => [comments];
}
