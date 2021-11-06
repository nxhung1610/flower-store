part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppLoad extends AuthEvent {}

// Fired when a user has successfully logged in
class UserLoggedIn extends AuthEvent {
  final String accessToken;

  UserLoggedIn({
    required this.accessToken,
  });

  @override
  List<Object> get props => [accessToken];
}

// Fired when the user has logged out
class UserLoggedOut extends AuthEvent {}
