part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserName extends UserEvent {
  final String userName;
  final int userId;

  const UpdateUserName({required this.userId, required this.userName});
  @override
  List<Object> get props => [userName, userId];
}
