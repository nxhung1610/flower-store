import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/role/role.dart';
import 'package:flower_store/src/models/user/staff.dart';
import 'package:flower_store/src/services/app_repository.dart';
import 'package:flower_store/src/services/base/base_repository.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:flower_store/src/utils/prefs/pref_keys.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppLoad>((event, emit) async {
      if (BaseRepository.tokenAuth.isNotEmpty) {
        add(UserLoggedIn());
      } else
        add(UserLoggedOut());
    });
    on<UserLoggedIn>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        emit(AuthenticationAuthenticated(
            staff: await AppRepository().authentication.profileInfo()));
      } catch (e) {
        emit(AuthenticationFailure(message: e.toString()));
      }
    });
    on<UserLoggedOut>((event, emit) async {
      await AppRepository().authentication.logout();

      emit(AuthenticationNotAuthenticated());
    });
    add(AppLoad());
  }
}
