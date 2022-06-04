part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class LoadChannelsPosts extends PostEvent {
  final int channelId;

  LoadChannelsPosts(this.channelId);
}

class UploadPost extends PostEvent {
  final int channelId;
  final String postTitle;
  final String postContent;
  final String? imagePath;

  UploadPost(this.channelId, this.postTitle, this.postContent,
      {this.imagePath});
}

class CancelUploadPost extends PostEvent {}
