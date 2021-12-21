import 'package:flower_store/src/screens/dashboard/bill/detail_bill_page.dart';
import 'package:flower_store/src/screens/dashboard/cart/cart_page.dart';
import 'package:flower_store/src/screens/dashboard/checkout/checkout_page.dart';
import 'package:flower_store/src/screens/init/init_screen.dart';
import 'package:flower_store/src/screens/main/main_screen.dart';
import 'package:flower_store/src/screens/manager_account/add_account/add_account_page.dart';
import 'package:flower_store/src/screens/manager_account/detail_account/detail_account_page.dart';
import 'package:flower_store/src/screens/manager_account/manager_account_page.dart';
import 'package:flower_store/src/screens/screen.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    printLog('The Route is : ${settings.name}');
    switch (settings.name) {
      case InitScreen.nameRoute:
        return InitScreen.route(settings);
      case WelcomeScreen.nameRoute:
        return WelcomeScreen.route(settings);
      case MainScreen.nameRoute:
        return MainScreen.route(settings);
      case ManagerAccountPage.nameRoute:
        return ManagerAccountPage.route(settings);
      case DetailAccountPage.nameRoute:
        return DetailAccountPage.route(settings);
      case AddAccountPage.nameRoute:
        return AddAccountPage.route(settings);
      case CartPage.nameRoute:
        return CartPage.route(settings);
      case CheckOutPage.nameRoute:
        return CheckOutPage.route(settings);
      case DetailBillPage.nameRoute:
        return DetailBillPage.route(settings);
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
