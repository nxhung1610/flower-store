part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginDeviceEvent extends AuthEvent {
  final String devicekey;

  AuthLoginDeviceEvent({required this.devicekey});
  @override
  // TODO: implement props
  List<Object> get props => [devicekey];
}

class AuthPincodeValidateEvent extends AuthEvent {
  final String pincode;
  AuthPincodeValidateEvent({required this.pincode});
  @override
  // TODO: implement props
  List<Object> get props => [pincode];
}
