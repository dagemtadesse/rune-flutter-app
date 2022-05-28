import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_channels_event.dart';
part 'my_channels_state.dart';

class MyChannelsBloc extends Bloc<MyChannelsEvent, MyChannelsState> {
  MyChannelsBloc() : super(MyChannelsInitial()) {
    on<MyChannelsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
