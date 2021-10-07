import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginDeviceEvent>((event, emit) async {
      emit(AuthRequestValidating());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(AuthRequestSuccess(resData: ''));
      } catch (e) {
        emit(AuthRequestFail(message: ''));
      }
    });
    on<AuthPincodeValidateEvent>((event, emit) async {
      emit(AuthRequestValidating());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(AuthRequestSuccess(resData: ''));
      } catch (e) {
        emit(AuthRequestFail(message: ''));
      }
    });
  }
}
