import 'package:bloc/bloc.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/infrastructure/api_response.dart';
import 'package:rune/infrastructure/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.userRepository}) : super(NoAuthRequestSent()) {
    on<LoginRequest>(_handleLogin);
    on<SignUpRequest>(_handleSignUp);
    on<ChangePasswordRequest>(_handleChangePassword);
  }

  final UserRepository userRepository;

  _handleLogin(LoginRequest event, emit) async {
    emit(AuthRequestSent());
    final expect = await userRepository.login(event.email, event.password);
    if (expect.hasError) {
      emit(AuthRequestFailure(expect.error));
      return;
    }

    emit(AuthRequestSuccess(expect.data));
  }

  _handleSignUp(SignUpRequest event, emit) async {
    emit(AuthRequestSent());
    final expect = await userRepository.register(
        event.email, event.password, event.fullName);
    if (expect.hasError) {
      emit(AuthRequestFailure(expect.error));
      return;
    }

    emit(AuthRequestSuccess(expect.data));
  }

  _handleChangePassword(ChangePasswordRequest event, emit) async {
    emit(AuthRequestSent());
    final expect = await userRepository.changePassword(
        event.password, event.newPassword, event.email);
    if (expect.hasError) {
      emit(AuthRequestFailure(expect.error));
      return;
    }

    emit(AuthRequestSuccessWithMessage(
        userRepository.loggedInUser, "Password changed!"));
  }
}
