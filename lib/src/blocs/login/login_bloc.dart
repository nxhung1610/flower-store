import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/models/user/staff.dart';
import 'package:flower_store/src/services/app_repository.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthBloc authBloc;

  LoginBloc({required this.authBloc}) : super(LoginInitial()) {
    on<LoginRequestEvent>((event, emit) async {
      emit(LoginRequestLoading());
      try {
        await AppRepository().authentication.login(
              email: event.email,
              password: event.password,
            );
        authBloc.add(
          UserLoggedIn(),
        );
        emit(LoginRequestSuccess());
      } catch (e) {
        if (e is Response)
          emit(LoginRequestFail(message: e.data["message"]));
        else
          emit(LoginRequestFail(message: e.toString()));
      }
    });
  }
}
