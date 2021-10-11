import 'package:flower_store/src/screens/init/init_screen.dart';
import 'package:flower_store/src/screens/main/main_screen.dart';
import 'package:flower_store/src/screens/screen.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    printLog('The Route is : ${settings.name}');
    switch (settings.name) {
      case InitScreen.nameRoute:
        return InitScreen.route();
      case WelcomeScreen.nameRoute:
        return WelcomeScreen.route();
      case LoginScreen.nameRoute:
        return LoginScreen.route();
      case MainScreen.nameRoute:
        return MainScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Container(
          child: Center(
            child: Text('Error'),
          ),
        ),
      ),
      settings: RouteSettings(
        name: '/error',
      ),
    );
  }
}
