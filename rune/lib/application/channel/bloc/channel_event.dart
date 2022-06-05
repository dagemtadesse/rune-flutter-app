part of 'channel_bloc.dart';

@immutable
abstract class ChannelEvent extends Equatable {
  const ChannelEvent();

  @override
  List<Object> get props => [];
}

class LoadChannels extends ChannelEvent {
  final String query;
  final bool onlyMarked;
  const LoadChannels({this.query = "", this.onlyMarked = false});
}

class CreateChannel extends ChannelEvent {
  final String name;
  final String description;
  final String email;
  final String location;

  CreateChannel(this.name, this.description, this.email, this.location);
}

class DeleteChannel extends ChannelEvent {
  final Channel channel;

  const DeleteChannel({required this.channel});
  @override
  List<Object> get props => [channel];
}

class ChanneIdle extends ChannelEvent {}

class VoteChannel extends ChannelEvent {
  final int channelId;

  VoteChannel(this.channelId);
}

class PinChannel extends ChannelEvent {
  final Channel channel;
  final bool unpin;
  PinChannel(this.channel, this.unpin);
}
