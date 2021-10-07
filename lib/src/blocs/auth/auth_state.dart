part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthRequestValidating extends AuthState {}

class AuthRequestSuccess extends AuthState {
  final dynamic resData;
  AuthRequestSuccess({required this.resData});
  @override
  // TODO: implement props
  List<Object> get props => [resData];
}

class AuthRequestFail extends AuthState {
  final String message;

  AuthRequestFail({required this.message});
}
