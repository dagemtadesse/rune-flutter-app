part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class LoadChannelsPosts extends PostEvent {
  final int channelId;

  LoadChannelsPosts(this.channelId);
}
