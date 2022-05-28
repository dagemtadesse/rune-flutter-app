import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_channel_event.dart';
part 'create_channel_state.dart';

class CreateChannelBloc extends Bloc<CreateChannelEvent, CreateChannelState> {
  CreateChannelBloc() : super(CreateChannelInitial()) {
    on<CreateChannelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
