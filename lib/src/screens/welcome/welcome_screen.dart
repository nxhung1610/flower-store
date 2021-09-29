import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String nameRoute = '/welcome';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => WelcomeScreen(),
      settings: RouteSettings(name: nameRoute),
    );
  }

  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
