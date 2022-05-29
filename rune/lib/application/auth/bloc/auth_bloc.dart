import 'package:bloc/bloc.dart';
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
    try {
      emit(AuthRequestSent());
      await userRepository.login(event.email, event.password);
      emit(AuthRequestSuccess());
    } catch (error) {
      final errorMsg = error is APIResponse ? error.message : error;
      emit(AuthRequestFailure(errorMsg as String));
    }
  }

  _handleSignUp(SignUpRequest event, emit) async {
    try {
      emit(AuthRequestSent());
      await userRepository.register(
          event.email, event.password, event.fullName);
      emit(AuthRequestSuccess());
    } catch (error) {
      print(error);
      final errorMsg = error is APIResponse ? error.message : error;
      emit(AuthRequestFailure(errorMsg as String));
    }
  }

  _handleChangePassword(event, emit) {}
}
