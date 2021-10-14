part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// Fired when a user has successfully logged in
class UserLoggedIn extends AuthEvent {
  final Staff staff;

  UserLoggedIn({required this.staff});

  @override
  List<Object> get props => [staff];
}

// Fired when the user has logged out
class UserLoggedOut extends AuthEvent {}
