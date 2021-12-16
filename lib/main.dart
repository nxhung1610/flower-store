import 'dart:async';
import 'package:reflectable/reflectable.dart';
import 'package:flower_store/app.dart';
import 'package:flower_store/src/utils/app_bloc_observer.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  printLog('=========== APP RUN =========');
  WidgetsFlutterBinding.ensureInitialized();

  await AppPreferences.init().then((value) {
    Bloc.observer = AppBlocObserver();
  });
  runZoned(() {
    runApp(App());
  });
}
