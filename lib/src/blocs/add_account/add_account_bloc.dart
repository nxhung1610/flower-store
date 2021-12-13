import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/utils/helper/app_helper.dart';
import 'package:flutter/material.dart';

part 'add_account_event.dart';
part 'add_account_state.dart';

class AddAccountBloc extends Bloc<AddAccountEvent, AddAccountState> {
  AddAccountBloc() : super(AddAccountState()) {
    on<AddAccountChooseImage>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true,status: FormStatus.Loading));
        final image = await openImagePicker();
        emit(state.copyWith(isLoading: false));
        if (image != null) {
          emit(state.copyWith(avatarPath: image.path , status: FormStatus.FillForm));
        }
      },
    );
    on<AddAccountSubmit>((event, emit) async {
      emit(state.copyWith(isLoading: true,status: FormStatus.Loading));
      try {
        _validationSubmit(state);
        emit(state.copyWith(isLoading: false));
      } on Exception catch (error) {
        emit(state.copyWith(isLoading: false));
        emit(state.copyWith(errorMessage: error.toString(),status: FormStatus.Error));
      }
    });

    
    on<NameStaffChanged>((event, emit) async {
      emit(state.copyWith(nameStaff: event.nameStaff, status: FormStatus.FillForm));
    });
    on<NameStaffStatus>((event, emit) async {
      emit(state.copyWith(isNameReadOnly: event.isNameReadOnly, status: FormStatus.FillForm));
    });
    on<RoleChanged>((event, emit) async {
      emit(state.copyWith(role: event.type, status: FormStatus.FillForm));
    });
    on<PhoneNumberChanged>((event, emit) async {
      emit(state.copyWith(phoneNumber: event.phoneNumber, status: FormStatus.FillForm));
    });
    on<EmailAddressChanged>((event, emit) async {
      emit(state.copyWith(emailAddress: event.emailAddress, status: FormStatus.FillForm));
    });
    on<PasswordChanged>((event, emit) async {
      emit(state.copyWith(password: event.password, status: FormStatus.FillForm));
    });
  }

  void _validationSubmit(AddAccountState state) {
    // Valid Phone
    final regexPhone = RegExp(r"(84|0[3|5|7|8|9])+([0-9]{8})\b");
    if (!regexPhone.hasMatch(state.phoneNumber))
      throw new Exception('Phone not valid');
    // Valid Email
    final regexEmail = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!regexEmail.hasMatch(state.emailAddress))
      throw new Exception('Email not valid');
    // Valid Email
    final regexPassword =
        RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$");
    if (!regexPassword.hasMatch(state.password))
      throw new Exception(
          'Password must contain 8 characters, at least one uppercase letter, one lowercase letter and one number');
  }
}
