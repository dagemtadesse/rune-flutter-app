import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_comment_event.dart';
part 'my_comment_state.dart';

class MyCommentBloc extends Bloc<MyCommentEvent, MyCommentState> {
  MyCommentBloc() : super(MyCommentInitial()) {
    on<MyCommentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
