import 'package:flower_store/src/screens/screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is : ${settings.name}');
    switch (settings.name) {
      case '/':
        return WelcomeScreen.route();
      case WelcomeScreen.nameRoute:
        return WelcomeScreen.route();
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
        ));
  }
}
