part of 'add_account_bloc.dart';

abstract class AddAccountEvent extends Equatable {
  const AddAccountEvent();

  @override
  List<Object> get props => [];
}

class AddAccountChooseImage extends AddAccountEvent {}

class AddAccountSubmit extends AddAccountEvent {}

class PhoneNumberChanged extends AddAccountEvent {
  final String phoneNumber;

  PhoneNumberChanged({required this.phoneNumber});
  @override
  // TODO: implement props
  List<Object> get props => [phoneNumber];
}

class EmailAddressChanged extends AddAccountEvent {
  final String emailAddress;

  EmailAddressChanged({required this.emailAddress});

  @override
  // TODO: implement props
  List<Object> get props => [emailAddress];
}

class PasswordChanged extends AddAccountEvent {
  final String password;

  PasswordChanged({required this.password});
  @override
  // TODO: implement props
  List<Object> get props => [password];
}

class NameStaffStatus extends AddAccountEvent {
  final bool isNameReadOnly;

  NameStaffStatus({required this.isNameReadOnly});
  @override
  // TODO: implement props
  List<Object> get props => [isNameReadOnly];
}

class NameStaffChanged extends AddAccountEvent {
  final String nameStaff;

  NameStaffChanged({required this.nameStaff});
  @override
  // TODO: implement props
  List<Object> get props => [nameStaff];
}

class RoleChanged extends AddAccountEvent {
  final RoleType type;

  RoleChanged({required this.type});
  @override
  // TODO: implement props
  List<Object> get props => [type];
}
