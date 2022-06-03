part of 'navigation_cubit.dart';

abstract class NavigationState {}

class DefaultScreen extends NavigationState {}

class LoginScreen extends NavigationState {}

class RegisterScreen extends NavigationState {}

class DashboardScreen extends NavigationState {
  final User loggedInUser;

  DashboardScreen(this.loggedInUser);
}

class ChannelScreen extends NavigationState {
  final Channel selectedChannel;

  ChannelScreen(this.selectedChannel);
}
