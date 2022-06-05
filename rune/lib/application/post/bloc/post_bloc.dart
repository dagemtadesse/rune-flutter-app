import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rune/domain/models.dart';
import 'dart:developer' as developer;
import 'package:rune/infrastructure/repositories.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  final UserRepository userRepository;

  PostBloc(this.postRepository, this.userRepository) : super(LoadingPosts()) {
    on<LoadChannelsPosts>(_onLoadChannelPosts);
    on<UploadPost>(_handleSendUploadPostEvent);
    on<CancelUploadPost>(_handleCancelUploadPostEvent);
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

  _handleSendUploadPostEvent(UploadPost event, emit) async {
    emit(UploadingPost());

    final expectedPost = await postRepository.createPost(
        userRepository, event.channelId, event.postTitle, event.postContent);
    if (!expectedPost.hasError) {
      emit(UploadingPostSucced());
      return;
    }

    emit(UploadingPostFailed());
  }

  _handleCancelUploadPostEvent(event, emit) {
    emit(UploadingPostCancled());
  }
}

  // UploadPostBloc() : super(UploadPostState.unSentPostUploadState) {
  //   on<SendUploadPostEvent>(_handleSendUploadPostEvent);
  //   on<CancelUploadPostEvent>(_handleCancelUploadPostEvent);
  // }

  // _handleSendUploadPostEvent(SendUploadPostEvent event, emit) async {
  //   emit(UploadPostState.sentPostUploadState);
  //   try {
  //     await Future.delayed(const Duration(seconds: 5));
  //     await uploadPost(
  //         event.channelId, event.postTitle, event.postContent, event.imagePath);
  //     emit(UploadPostState.donePostUploadState);
  //   } catch (e) {
  //     emit(UploadPostState.errorPostUploadState);
  //   }
  // }

  // _handleCancelUploadPostEvent(event, emit) {
  //   emit(UploadPostState.donePostUploadState);
  // }