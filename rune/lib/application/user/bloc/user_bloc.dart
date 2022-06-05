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
    on<RequestAdminAccess>(_onRequestAdminAccess);
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<UserState> emit) async {
    emit(UserUpdating());
    final updated = await userRepository.updateUser(
        fullname: event.fullName, email: event.email, handle: event.handle);
    if (updated.hasError) {
      emit(UserUpdateFailed(errMsg: updated.error));
      return;
    }
    emit(UserUpdateSuccessful());
  }

  void _onRequestAdminAccess(event, emit) async {
    emit(AdminAccessRequested());
    final updated = await userRepository.updateUser(makeAdmin: true);
    if (updated.hasError) {
      emit(AdminAccessRefused());
      return;
    }
    emit(AdminAccessGranted());
  }
}
