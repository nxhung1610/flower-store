import 'package:flower_store/src/utils/base/screen_config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String nameRoute = '/login';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
      settings: RouteSettings(name: nameRoute),
    );
  }

  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenConfig(
      builder: () => Scaffold(
        body: _BodyScreen(),
      ),
    );
  }
}

class _BodyScreen extends StatelessWidget {
  const _BodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
