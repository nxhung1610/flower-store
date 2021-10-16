import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/staff.dart';
import 'package:flower_store/src/services/authentication/authentication_service.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:flower_store/src/utils/prefs/pref_keys.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthServiceImpl authService;
  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<AppLoad>((event, emit) async {
      final refreshToken =
          AppPreferences.prefs.getString(PrefKeys.REFRESH_TOKEN);
      if (refreshToken != null && refreshToken.isNotEmpty) {
        add(UserLoggedIn(refreshToken: refreshToken));
      } else
        add(UserLoggedOut());
    });
    on<UserLoggedIn>((event, emit) async {
      final refreshToken = event.refreshToken;
      emit(AuthenticationLoading());
      AppPreferences.prefs.setString(PrefKeys.REFRESH_TOKEN, refreshToken);
      try {
        //Get new access token
        final getAccessToken =
            await authService.requestNewToken(refreshToken: refreshToken);
        if (getAccessToken.error) throw new Exception(getAccessToken.message);
        final accessToken = getAccessToken.data!['accessToken'].toString();

        // Get profile of accessToken
        final getInfoStaff =
            await authService.getProfile(accessToken: accessToken);
        if (getInfoStaff.error) throw new Exception(getInfoStaff.message);

        emit(AuthenticationAuthenticated(staff: getInfoStaff.data!));
      } catch (e) {
        emit(AuthenticationFailure(message: e.toString()));
      }
    });
    on<UserLoggedOut>((event, emit) {
      emit(AuthenticationNotAuthenticated());
    });

    add(AppLoad());
  }
}
