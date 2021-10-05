part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginDevice extends AuthEvent {
  final String devicekey;

  AuthLoginDevice({required this.devicekey});
  @override
  // TODO: implement props
  List<Object> get props => [devicekey];
}

class AuthPincodeValidate extends AuthEvent {
  final String pincode;
  AuthPincodeValidate({required this.pincode});
  @override
  // TODO: implement props
  List<Object> get props => [pincode];
}
