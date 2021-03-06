import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/domain/models.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(DefaultRoute());

  void toLoginScreen() => emit(LoginRoute());
  void toRegisterScreen() => emit(RegisterRoute());
  void toSplashScreen() => emit(DefaultRoute());
  void toEditProfile(User user) => emit(EditProfileRoute(user));
  void toBookmarksScreen() => emit(BookmarksRoute());
  void toCommentsScreen() => emit(CommentsRoute());
  void toChannelScreen(Channel channel) => emit(ChannelRoute(channel));
  void toCreateChannelScreen() => emit(CreateChannelRoute());
  void toPostsScreen() => emit(PostsRoute());
  void toChangePasswordScreen(User user) => emit(ChangePasswordRoute(user));
  void toDashboardScreen(User user, [int tabIndex = 0]) =>
      emit(DashboardRoute(user, tabIndex));
}
