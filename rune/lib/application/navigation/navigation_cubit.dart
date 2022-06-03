import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/domain/models.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(DefaultScreen());

  void toLoginScreen() => emit(LoginScreen());
  void toRegisterScreen() => emit(RegisterScreen());
  void toSplashScreen() => emit(DefaultScreen());
  void toDashboardScreen(User user) => emit(DashboardScreen(user));
}
