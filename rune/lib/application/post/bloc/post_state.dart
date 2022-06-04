part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class LoadingPosts extends PostState {}

class LoadingPostsSucced extends PostState {
  final List<Post> posts;

  LoadingPostsSucced(this.posts);
}

class LoadingPostFailed extends PostState {
  final String errorMessage;

  LoadingPostFailed(this.errorMessage);
}
