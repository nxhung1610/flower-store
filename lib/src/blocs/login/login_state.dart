part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginRequestLoading extends LoginState {}

class LoginRequestSuccess extends LoginState {}

class LoginRequestFail extends LoginState {
  final String message;

  LoginRequestFail({required this.message});
}
