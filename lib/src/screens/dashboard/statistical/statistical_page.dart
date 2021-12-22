import 'package:flower_store/src/blocs/bill/bill_bloc.dart';
import 'package:flower_store/src/blocs/bill/bill_event.dart';
import 'package:flower_store/src/blocs/bill/bill_state.dart';
import 'package:flower_store/src/screens/dashboard/statistical/widget/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/src/provider.dart';

class StatisticalPage extends StatefulWidget {
  StatisticalPage({Key? key}) : super(key: key);

  @override
  _StatisticalPageState createState() => _StatisticalPageState();
}

class _StatisticalPageState extends State<StatisticalPage> {
  late BillBloc bloc;
  @override
  void initState() {
    bloc = context.read<BillBloc>();
    bloc.add(BillLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BillBloc(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Chart(),
          ],
        ),
      ),
    );
  }
}
