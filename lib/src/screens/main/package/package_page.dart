import 'package:flutter/material.dart';

class PackagePage extends StatefulWidget {
  PackagePage({Key? key}) : super(key: key);

  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('PackagePage'),
      ),
    );
  }
}
