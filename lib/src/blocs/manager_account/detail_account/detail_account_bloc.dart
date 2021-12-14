import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/blocs/manager_account/detail_account/detail_account.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/services/app_repository.dart';
import 'package:flower_store/src/utils/helper/app_helper.dart';

part 'detail_account_event.dart';
part 'detail_account_state.dart';

class DetailAccountBloc extends Bloc<DetailAccountEvent, DetailAccountState> {
  final Staff staff;
  DetailAccountBloc({required this.staff})
      : super(DetailAccountState(
          avatarPath: staff.url,
          emailAddress: staff.email,
          nameStaff: staff.name,
          phoneNumber: staff.phone ?? '',
          role: staff.role,
        )) {
    on<DetailAccountChooseImage>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true, status: FormStatus.Loading));
        final image = await openImagePicker();

        emit(state.copyWith(isLoading: false, status: FormStatus.Loading));

        await Future.delayed(Duration(milliseconds: 300));
        if (image != null) {
          emit(state.copyWith(
              avatarPath: image.path,
              isAvatarLocal: true,
              status: FormStatus.FillForm));
        }
      },
    );
    on<DetailAccountSubmit>((event, emit) async {
      emit(state.copyWith(isLoading: true, status: FormStatus.Loading));
      try {
        _validationSubmit(state);
        await AppRepository().authentication.update(
              staffId: staff.sId,
              isAvatarLocal: state.isAvatarLocal,
              avatarPath: state.avatarPath,
              nameStaff: staff.name == state.nameStaff ? null : state.nameStaff,
              role: staff.role == state.role ? null : state.role,
              phoneNumber:
                  staff.phone == state.phoneNumber ? null : state.phoneNumber,
              emailAddress:
                  staff.email == state.emailAddress ? null : state.emailAddress,
            );
        emit(state.copyWith(isLoading: false, status: FormStatus.Loading));
        emit(state.copyWith(status: FormStatus.Success));
      } catch (error) {
        await Future.delayed(Duration(milliseconds: 300));
        emit(state.copyWith(isLoading: false, status: FormStatus.Loading));
        await Future.delayed(Duration(milliseconds: 300));
        emit(state.copyWith(
            errorMessage: error.toString(), status: FormStatus.Error));
      }
    });

    on<NameStaffChanged>((event, emit) async {
      emit(state.copyWith(
          nameStaff: event.nameStaff, status: FormStatus.FillForm));
    });
    on<NameStaffStatus>((event, emit) async {
      emit(state.copyWith(
          isNameReadOnly: event.isNameReadOnly, status: FormStatus.FillForm));
    });
    on<RoleChanged>((event, emit) async {
      emit(state.copyWith(role: event.type, status: FormStatus.FillForm));
    });
    on<PhoneNumberChanged>((event, emit) async {
      emit(state.copyWith(
          phoneNumber: event.phoneNumber, status: FormStatus.FillForm));
    });
    on<EmailAddressChanged>((event, emit) async {
      emit(state.copyWith(
          emailAddress: event.emailAddress, status: FormStatus.FillForm));
    });
    on<PasswordChanged>((event, emit) async {
      emit(state.copyWith(
          password: event.password, status: FormStatus.FillForm));
    });

    on<DetailAcccountDelete>((event, emit) async {
      emit(state.copyWith(isLoading: true, status: FormStatus.Loading));
      try {
        await AppRepository().authentication.delete(staffId: staff.sId);
        emit(state.copyWith(isLoading: false, status: FormStatus.Loading));
        emit(state.copyWith(status: FormStatus.Success));
      } catch (error) {
        await Future.delayed(Duration(milliseconds: 300));
        emit(state.copyWith(isLoading: false, status: FormStatus.Loading));
        await Future.delayed(Duration(milliseconds: 300));
        emit(state.copyWith(
            errorMessage: error.toString(), status: FormStatus.Error));
      }
    });
  }

  void _validationSubmit(DetailAccountState state) {
    // Valid Phone
    final regexPhone = RegExp(r"(84|0[3|5|7|8|9])+([0-9]{8})\b");
    if (!regexPhone.hasMatch(state.phoneNumber))
      throw new Exception('Phone not valid');
    // Valid Email
    final regexEmail = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!regexEmail.hasMatch(state.emailAddress))
      throw new Exception('Email not valid');
  }
}
