import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/prefs/PrefKeys.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:meta/meta.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc() : super(InitInitialState()) {
    on<InitRequestedEvent>((event, emit) async {
      emit(InitLoadingState());
      await Future.delayed(Duration(seconds: 5));
      try {
        if (!_checkLogin()) {
          // Check if new app , show welcome screen
          if (!(AppPreferences.prefs.getBool(PrefKeys.SHOW_WELCOME_SCREEN) ??
              false)) {
            emit(InitSuccessState(initType: InitType.welcome));
          } else
            emit(InitSuccessState(initType: InitType.notlogin));
        } else
          emit(InitSuccessState(initType: InitType.hadlogin));
      } catch (e) {
        emit(InitFaliedState());
      }
    });
  }

  bool _checkLogin() {
    return false;
  }
}
