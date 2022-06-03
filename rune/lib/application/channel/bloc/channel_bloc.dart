import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'channel_event.dart';
part 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc() : super(ChannelInitial()) {
    on<ChannelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
