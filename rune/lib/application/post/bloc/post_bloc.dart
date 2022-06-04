import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/repositories.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  final UserRepository userRepository;

  PostBloc(this.postRepository, this.userRepository) : super(LoadingPosts()) {
    on<LoadChannelsPosts>(_onLoadChannelPosts);
  }

  void _onLoadChannelPosts(LoadChannelsPosts event, emit) async {
    emit(LoadingPosts());
    final expectedPosts =
        await postRepository.getPosts(userRepository, event.channelId, 0);
    if (expectedPosts.hasError) {
      emit(LoadingPostFailed(expectedPosts.error));
      return;
    }

    emit(LoadingPostsSucced(expectedPosts.data));
  }
}
