part of 'channel_bloc.dart';

@immutable
abstract class ChannelEvent extends Equatable {
  const ChannelEvent();

  @override
  List<Object> get props => [];
}

class LoadChannels extends ChannelEvent {
  const LoadChannels();
}

class CreateChannel extends ChannelEvent {
  final Channel channel;

  const CreateChannel({required this.channel});
  @override
  List<Object> get props => [channel];
}

class DeleteChannel extends ChannelEvent {
  final Channel channel;

  const DeleteChannel({required this.channel});
  @override
  List<Object> get props => [channel];
}

class SearchChannel extends ChannelEvent {
  final Channel channel;

  const SearchChannel({required this.channel});
  @override
  List<Object> get props => [channel];
}
