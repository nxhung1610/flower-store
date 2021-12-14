part of 'detail_account_bloc.dart';

abstract class DetailAccountEvent extends Equatable {
  const DetailAccountEvent();

  @override
  List<Object> get props => [];
}

class DetailAccountChooseImage extends DetailAccountEvent {}

class DetailAccountSubmit extends DetailAccountEvent {}

class DetailAcccountDelete extends DetailAccountEvent {}

class PhoneNumberChanged extends DetailAccountEvent {
  final String phoneNumber;

  PhoneNumberChanged({required this.phoneNumber});
  @override
  // TODO: implement props
  List<Object> get props => [phoneNumber];
}

class EmailAddressChanged extends DetailAccountEvent {
  final String emailAddress;

  EmailAddressChanged({required this.emailAddress});

  @override
  // TODO: implement props
  List<Object> get props => [emailAddress];
}

class PasswordChanged extends DetailAccountEvent {
  final String password;

  PasswordChanged({required this.password});
  @override
  // TODO: implement props
  List<Object> get props => [password];
}

class NameStaffStatus extends DetailAccountEvent {
  final bool isNameReadOnly;

  NameStaffStatus({required this.isNameReadOnly});
  @override
  // TODO: implement props
  List<Object> get props => [isNameReadOnly];
}

class NameStaffChanged extends DetailAccountEvent {
  final String nameStaff;

  NameStaffChanged({required this.nameStaff});
  @override
  // TODO: implement props
  List<Object> get props => [nameStaff];
}

class RoleChanged extends DetailAccountEvent {
  final RoleType type;

  RoleChanged({required this.type});
  @override
  // TODO: implement props
  List<Object> get props => [type];
}