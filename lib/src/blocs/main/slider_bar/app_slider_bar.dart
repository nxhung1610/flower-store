import 'package:flutter/material.dart';

class AppSliderBar extends StatefulWidget {
  AppSliderBar({Key? key}) : super(key: key);

  @override
  _AppSliderBarState createState() => _AppSliderBarState();
}

class _AppSliderBarState extends State<AppSliderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
