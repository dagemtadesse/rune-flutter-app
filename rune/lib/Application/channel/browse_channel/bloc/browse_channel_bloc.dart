import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'browse_channel_event.dart';
part 'browse_channel_state.dart';

class BrowseChannelBloc extends Bloc<BrowseChannelEvent, BrowseChannelState> {
  BrowseChannelBloc() : super(BrowseChannelInitial()) {
    on<BrowseChannelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
