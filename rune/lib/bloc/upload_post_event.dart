part of 'upload_post_bloc.dart';

abstract class UploadPostEvent {}

class CancelUploadPostEvent extends UploadPostEvent {}

class SendUploadPostEvent extends UploadPostEvent {
  final int channelId;
  final String postTitle;
  final String postContent;
  final String? imagePath;

  SendUploadPostEvent(this.channelId, this.postTitle, this.postContent,
      {this.imagePath});
}

// class DoneUploadPostEvent extends UploadPostEvent {}

// class ErrorUploadPostEvent extends UploadPostEvent {}
