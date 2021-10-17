import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/role.dart';
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
  List<Role> roles = [];
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
        if (staff == null) {
          // Get profile of accessToken
          final getInfoStaff =
              await authService.getProfile(accessToken: await getAccessToken());
          if (getInfoStaff.error) throw new Exception(getInfoStaff.message);
          staff = getInfoStaff.data!;
        }
        emit(AuthenticationAuthenticated(staff: staff!));
      } catch (e) {
        emit(AuthenticationFailure(message: e.toString()));
      }
    });
    on<UserLoggedOut>((event, emit) {
      staff = null;
      AppPreferences.prefs.remove(PrefKeys.REFRESH_TOKEN);
      emit(AuthenticationNotAuthenticated());
    });
    add(AppLoad());
  }

  Future<String> getAccessToken() async {
    await _refreshToken();
    return AppPreferences.prefs.getString(PrefKeys.ACCESS_TOKEN)!;
  }

  _refreshToken() async {
    var accessToken = AppPreferences.prefs.getString(PrefKeys.ACCESS_TOKEN);
    final refreshToken = AppPreferences.prefs.getString(PrefKeys.REFRESH_TOKEN);
    if (accessToken != null) {
      final isValid =
          await authService.validAccessToken(accessToken: accessToken);
      if (!isValid.error) return accessToken;
    }
    //Get new access token
    final getAccessToken =
        await authService.requestNewAccessToken(refreshToken: refreshToken!);
    if (getAccessToken.error) throw new Exception(getAccessToken.message);
    AppPreferences.prefs.setString(
        PrefKeys.ACCESS_TOKEN, getAccessToken.data!['accessToken'].toString());
  }
}
