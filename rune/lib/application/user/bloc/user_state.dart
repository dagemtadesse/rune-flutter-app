part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserIdle extends UserState {}

class UserUpdating extends UserState {}

class AdminAccessRequested extends UserState {}

class AdminAccessGranted extends UserState {}

class AdminAccessRefused extends UserState {}

class UserUpdateSuccessful extends UserState {}

class UserUpdateFailed extends UserState {
  final String errMsg;

  const UserUpdateFailed({required this.errMsg});

  @override
  List<Object> get props => [errMsg];
}
