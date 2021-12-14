part of 'add_account_bloc.dart';

class AddAccountState extends Equatable {
  final String avatarPath;
  final String nameStaff;
  final RoleType role;
  final String phoneNumber;
  final String emailAddress;
  final String password;
  final String? errorMessage;
  final FormStatus status;
  final bool isNameReadOnly;
  final bool isLoading;

  AddAccountState(
      {this.avatarPath = '',
      this.nameStaff = '',
      this.role = RoleType.Seller,
      this.phoneNumber = '',
      this.emailAddress = '',
      this.password = '',
      this.status = FormStatus.FillForm,
      this.isNameReadOnly = true,
      this.isLoading = false,
      this.errorMessage});

  AddAccountState copyWith(
      {String? avatarPath,
      String? nameStaff,
      RoleType? role,
      String? phoneNumber,
      String? emailAddress,
      String? password,
      FormStatus? status,
      bool? isNameReadOnly,
      bool? isLoading,
      String? errorMessage}) {
    return AddAccountState(
      avatarPath: avatarPath ?? this.avatarPath,
      nameStaff: nameStaff ?? this.nameStaff,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      isNameReadOnly: isNameReadOnly ?? this.isNameReadOnly,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        avatarPath,
        nameStaff,
        role,
        phoneNumber,
        emailAddress,
        password,
        isNameReadOnly,
        isLoading,
        status,
        errorMessage
      ];
}
