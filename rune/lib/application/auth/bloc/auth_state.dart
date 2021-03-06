part of 'auth_bloc.dart';

class AuthState {}

class NoAuthRequestSent extends AuthState {}

class AuthRequestSent extends AuthState {}

class AuthRequestFailure extends AuthState {
  final String message;

  AuthRequestFailure(this.message);
}

class AuthRequestSuccess extends AuthState {
  final User loggedUser;
  AuthRequestSuccess(this.loggedUser);
}

class AuthRequestSuccessWithMessage extends AuthState {
  final User loggedUser;
  final String message;
  AuthRequestSuccessWithMessage(this.loggedUser, this.message);
}
