part of 'channel_bloc.dart';

@immutable
abstract class ChannelState extends Equatable {
  const ChannelState();

  @override
  List<Object> get props => [];
}

class ChannelLoading extends ChannelState {}

class ChannelLoadedSuccessfuly extends ChannelState {
  final List<Channel> channels;

  const ChannelLoadedSuccessfuly({required this.channels});
  @override
  List<Object> get props => [channels];
}

class ChannleLoadingFailed extends ChannelState {
  final String errMsg;

  const ChannleLoadingFailed(this.errMsg);
}

class ChannelCreationFailed extends ChannelState {
  final String errMsg;

  const ChannelCreationFailed(this.errMsg);
}

class ChannelCreated extends ChannelState {
  final Channel channel;

  ChannelCreated(this.channel);
}

class ChannelVoted extends ChannelState {
  final Channel channel;

  ChannelVoted(this.channel);
}

class ChannelCreating extends ChannelState {}

class ChannelDeleted extends ChannelState {}