import 'package:bloc/bloc.dart';
import 'package:flower_store/src/prefs/PrefKeys.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:meta/meta.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeState(isShowed: true));

  void isAlreadyShow() {
    final _rs = AppPreferences.prefs.getBool(PrefKeys.SHOW_WELCOME_SCREEN);
    printLog('[Welcome Screen] Already showed Welcome : $_rs');
    if (_rs == null) {
      AppPreferences.prefs.setBool(PrefKeys.SHOW_WELCOME_SCREEN, false);
    }
    emit(WelcomeState(isShowed: _rs ?? false));
  }
}
