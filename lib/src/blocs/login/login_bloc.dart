import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/models/staff.dart';
import 'package:flower_store/src/services/authentication/authentication_service.dart';
import 'package:flutter/cupertino.dart';

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
        await Future.delayed(Duration(seconds: 2));
        authBloc.add(
          UserLoggedIn(
            staff:
                Staff(sId: 'sId', name: 'name', email: 'email', role: 'role'),
          ),
        );
        emit(LoginRequestSuccess());
      } catch (e) {
        emit(LoginRequestFail(message: ''));
      }
    });
  }
}
