import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_form_event.dart';
part 'post_form_state.dart';

class PostFormBloc extends Bloc<PostFormEvent, PostFormState> {
  PostFormBloc() : super(PostFormInitial()) {
    on<PostFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
