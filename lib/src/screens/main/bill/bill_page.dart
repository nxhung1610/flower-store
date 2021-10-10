import 'package:flutter/material.dart';

class BillPage extends StatefulWidget {
  BillPage({Key? key}) : super(key: key);

  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('BillPage'),
      ),
    );
  }
}
