part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginRequest extends AuthEvent {
  final String email;
  final String password;

  LoginRequest(this.email, this.password);
}

class SignUpRequest extends AuthEvent {
  final String fullName;
  final String email;
  final String password;

  SignUpRequest(this.fullName, this.email, this.password);
}

class ChangePasswordRequest extends AuthEvent {
  final String email;
  final String password;
  final String newPassword;

  ChangePasswordRequest(this.password, this.newPassword, this.email);
}
