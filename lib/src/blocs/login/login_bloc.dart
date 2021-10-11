import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequestEvent>((event, emit) async {
      emit(LoginRequestLoading());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(LoginRequestSuccess(resData: ''));
      } catch (e) {
        emit(LoginRequestFail(message: ''));
      }
    });
  }
}
