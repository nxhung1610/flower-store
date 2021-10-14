import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/staff.dart';
import 'package:flower_store/src/services/authentication/authentication_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthServiceImpl authService;
  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<UserLoggedIn>((event, emit) {
      emit(AuthenticationAuthenticated(staff: event.staff));
    });
  }
}
