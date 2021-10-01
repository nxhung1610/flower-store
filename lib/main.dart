import 'dart:async';

import 'package:flower_store/app.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flower_store/src/utils/helper/app_preferences.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  printLog('=========== APP RUN =========');
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  runZoned(() {
    runApp(App());
  });
}
