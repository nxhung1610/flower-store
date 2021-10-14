part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticationLoading extends AuthState {}

class AuthenticationNotAuthenticated extends AuthState {}

class AuthenticationAuthenticated extends AuthState {
  final Staff staff;

  AuthenticationAuthenticated({required this.staff});

  @override
  List<Object> get props => [staff];
}

class AuthenticationFailure extends AuthState {
  final String message;

  AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
