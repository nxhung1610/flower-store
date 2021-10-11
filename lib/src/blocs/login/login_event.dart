part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequestEvent extends LoginEvent {
  final String email;
  final String password;

  LoginRequestEvent({required this.email, required this.password});
  @override
  // TODO: implement props
  List<Object> get props => [email, password];
}
