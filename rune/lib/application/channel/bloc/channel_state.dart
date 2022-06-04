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

class ChannelCreated extends ChannelState {}

class ChannelDeleted extends ChannelState {}

class SearchSuccessful extends ChannelState {}
