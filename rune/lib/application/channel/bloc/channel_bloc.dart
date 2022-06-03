import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rune/domain/channel/channel_model.dart';

part 'channel_event.dart';
part 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc() : super(ChannelLoading()) {
    on<LoadChannels>(_onLoadChannels);
    on<CreateChannel>(_onCreateChannel);
    on<DeleteChannel>(_onDeleteChannel);
    on<SearchChannel>(_onSearchChannel);
  }

  void _onLoadChannels(LoadChannels event, Emitter<ChannelState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(ChannelLoadedSuccessfuly(channels: event.channels));
  }

  void _onCreateChannel(CreateChannel event, Emitter<ChannelState> emit) {
    final state = this.state;

    if (state is ChannelLoadedSuccessfuly) {
      emit(ChannelLoadedSuccessfuly(
          channels: List.from(state.channels)..add(event.channel)));
    }
  }

  void _onDeleteChannel(DeleteChannel event, Emitter<ChannelState> emit) {
    final state = this.state;

    if (state is ChannelLoadedSuccessfuly) {
      emit(ChannelLoadedSuccessfuly(
          channels: List.from(state.channels)..remove(event.channel)));
    }
  }

  void _onSearchChannel(SearchChannel event, Emitter<ChannelState> emit) {}
}
