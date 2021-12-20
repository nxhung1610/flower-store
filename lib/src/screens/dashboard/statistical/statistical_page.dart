import 'package:flower_store/src/blocs/bill/bill_bloc.dart';
import 'package:flower_store/src/blocs/bill/bill_event.dart';
import 'package:flower_store/src/blocs/bill/bill_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class StatisticalPage extends StatefulWidget {
  StatisticalPage({Key? key}) : super(key: key);

  @override
  _StatisticalPageState createState() => _StatisticalPageState();
}

class _StatisticalPageState extends State<StatisticalPage> {
  @override
  void initState() {
    context.read<BillBloc>().add(BillLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('StatisticalPage'),
      ),
    );
  }
}
