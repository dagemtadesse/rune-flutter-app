import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'send_comment_event.dart';
part 'send_comment_state.dart';

class SendCommentBloc extends Bloc<SendCommentEvent, SendCommentState> {
  SendCommentBloc() : super(SendCommentInitial()) {
    on<SendCommentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
