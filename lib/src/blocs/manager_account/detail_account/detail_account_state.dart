part of 'detail_account_bloc.dart';

class DetailAccountState extends Equatable {
  final String avatarPath;
  final String nameStaff;
  final RoleType role;
  final String phoneNumber;
  final String emailAddress;
  final String? errorMessage;
  final FormStatus status;
  final bool isAvatarLocal;
  final bool isNameReadOnly;
  final bool isLoading;
  DetailAccountState(
      {this.avatarPath = '',
      this.nameStaff = '',
      this.role = RoleType.Seller,
      this.phoneNumber = '',
      this.emailAddress = '',
      this.status = FormStatus.FillForm,
      this.isAvatarLocal = false,
      this.isNameReadOnly = true,
      this.isLoading = false,
      this.errorMessage});

  DetailAccountState copyWith(
      {String? avatarPath,
      String? nameStaff,
      RoleType? role,
      String? phoneNumber,
      String? emailAddress,
      String? password,
      FormStatus? status,
      bool? isAvatarLocal,
      bool? isNameReadOnly,
      bool? isLoading,
      String? errorMessage}) {
    return DetailAccountState(
      avatarPath: avatarPath ?? this.avatarPath,
      nameStaff: nameStaff ?? this.nameStaff,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      isAvatarLocal: isAvatarLocal ?? this.isAvatarLocal,
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
        isAvatarLocal,
        isNameReadOnly,
        isLoading,
        status,
        errorMessage
      ];
}
