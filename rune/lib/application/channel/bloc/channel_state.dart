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

abstract class SearchState extends ChannelState {
  const SearchState();

  @override
  List<Object> get props => [];

}

class SearchLoading extends SearchState {}

class SearchLoadedSuccesfully extends SearchState{
  final List<Channel> channels;

  const SearchLoadedSuccesfully({required this.channels});
  @override
  List<Object> get props => [channels];
}

class SearchLoadingFailed extends SearchState {
  final String errMsg;
  const SearchLoadingFailed(this.errMsg);
}

