import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rune/domain/channel/channel_model.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'dart:developer' as developer;

part 'channel_event.dart';
part 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final ChannelRepository channelRepo;
  final UserRepository userRepo;

  ChannelBloc(this.channelRepo, this.userRepo) : super(ChannelLoading()) {
    on<LoadChannels>(_onLoadChannels);
    on<CreateChannel>(_onCreateChannel);
    on<DeleteChannel>(_onDeleteChannel);
    on<SearchChannel>(_onSearchChannel);
  }

  void _onLoadChannels(LoadChannels event, Emitter<ChannelState> emit) async {
    emit(ChannelLoading());
    developer.log("logged in user is null ${userRepo.loggedInUser == null}");
    final expectedChannels =
        await channelRepo.getChannels(user: userRepo.loggedInUser);
    if (expectedChannels.hasError) {
      emit(ChannleLoadingFailed(expectedChannels.error));
      return;
    }

    emit(ChannelLoadedSuccessfuly(channels: expectedChannels.data));
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
