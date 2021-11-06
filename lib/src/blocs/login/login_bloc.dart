import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/models/staff.dart';
import 'package:flower_store/src/services/authentication_service.dart';
import 'package:flower_store/src/services/base/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthBloc authBloc;
  AuthServiceImpl authService;
  LoginBloc({required this.authBloc, required this.authService})
      : super(LoginInitial()) {
    on<LoginRequestEvent>((event, emit) async {
      emit(LoginRequestLoading());
      try {
        final response = await authService.login(
          email: event.email,
          password: event.password,
        );
        if (response.error) throw new Exception(response.message);
        authBloc.add(
          UserLoggedIn(
            accessToken: response.data!['accessToken'],
          ),
        );
        emit(LoginRequestSuccess());
      } catch (e) {
        emit(LoginRequestFail(message: e.toString()));
      }
    });
  }
}
