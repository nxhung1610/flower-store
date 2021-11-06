import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/role/role.dart';
import 'package:flower_store/src/models/staff.dart';
import 'package:flower_store/src/services/authentication_service.dart';
import 'package:flower_store/src/services/role_service.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:flower_store/src/utils/prefs/pref_keys.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthServiceImpl authService;
  Staff? staff;
  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<AppLoad>((event, emit) async {
      final accessToken = AppPreferences.prefs.getString(PrefKeys.ACCESS_TOKEN);
      if (accessToken != null && accessToken.isNotEmpty) {
        add(UserLoggedIn(accessToken: accessToken));
      } else
        add(UserLoggedOut());
    });
    on<UserLoggedIn>((event, emit) async {
      final accessToken = event.accessToken;
      emit(AuthenticationLoading());
      AppPreferences.prefs.setString(PrefKeys.ACCESS_TOKEN, accessToken);
      try {
        if (staff == null) {
          // Get profile of accessToken
          final getInfoStaff =
              await authService.getProfile(accessToken: accessToken);
          if (getInfoStaff.error) throw new Exception(getInfoStaff.message);
          staff = getInfoStaff.data!;
        }
        emit(AuthenticationAuthenticated(staff: staff!));
      } catch (e) {
        emit(AuthenticationFailure(message: e.toString()));
      }
    });
    on<UserLoggedOut>((event, emit) async {
      try {
        await authService.logout(
            accessToken:
                AppPreferences.prefs.getString(PrefKeys.ACCESS_TOKEN)!);
        staff = null;
        AppPreferences.prefs.remove(PrefKeys.ACCESS_TOKEN);
      } catch (e) {
        printLog(e);
      }
      emit(AuthenticationNotAuthenticated());
    });
    add(AppLoad());
  }
}
