import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rune/domain/models.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserIdle()) {
    on<UpdateUserName>(_onUpdating);
  }

  void _onUpdating(UpdateUserName event, Emitter<UserState> emit) {
    final state = this.state;

    if (state is UserIdle) {
      // TO DO : write an update code
    }
  }
}
