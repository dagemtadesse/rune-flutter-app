part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfile extends UserEvent {
  final String fullName;
  final String email;
  final String? handle;

  UpdateProfile(this.fullName, this.email, this.handle);
  @override
  List<Object> get props => [fullName, email];
}

class RequestAdminAccess extends UserEvent {}
