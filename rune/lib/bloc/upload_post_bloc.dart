import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/models/network/posts_request.dart';

part 'upload_post_event.dart';
part 'upload_post_state.dart';

class UploadPostBloc extends Bloc<UploadPostEvent, UploadPostState> {
  UploadPostBloc() : super(UploadPostState.unSentPostUploadState) {
    on<SendUploadPostEvent>(_handleSendUploadPostEvent);
    on<CancelUploadPostEvent>(_handleCancelUploadPostEvent);
  }

  _handleSendUploadPostEvent(SendUploadPostEvent event, emit) async {
    emit(UploadPostState.sentPostUploadState);
    try {
      await Future.delayed(const Duration(seconds: 5));
      await uploadPost(
          event.channelId, event.postTitle, event.postContent, event.imagePath);
      emit(UploadPostState.donePostUploadState);
    } catch (e) {
      emit(UploadPostState.errorPostUploadState);
    }
  }

  _handleCancelUploadPostEvent(event, emit) {
    emit(UploadPostState.donePostUploadState);
  }
}
