import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rune/infrastructure/repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserIdle()) {
    on<UpdateProfile>(_onUpdateProfile);
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<UserState> emit) async {
    emit(UserUpdating());
    final updated = await userRepository.updateUser(
        event.fullName, event.email, event.handle);
    if (updated.hasError) {
      emit(UserUpdateFailed(errMsg: updated.error));
      return;
    }
    emit(UserUpdateSuccessful());
  }
}
