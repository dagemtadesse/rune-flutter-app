part of 'navigation_cubit.dart';

abstract class NavigationState {}

class DefaultRoute extends NavigationState {}

class LoginRoute extends NavigationState {}

class RegisterRoute extends NavigationState {}

class EditProfileRoute extends NavigationState {}

class ChangePasswordRoute extends NavigationState {}

class CreateChannelRoute extends NavigationState {}

class CommentsRoute extends NavigationState {}

class PostsRoute extends NavigationState {}

class BookmarksRoute extends NavigationState {}

class DashboardRoute extends NavigationState {
  final User loggedInUser;
  final int tabIndex;

  DashboardRoute(this.loggedInUser, [this.tabIndex = 0]);
}

class ChannelRoute extends NavigationState {
  final Channel selectedChannel;

  ChannelRoute(this.selectedChannel);
}
