import 'package:flower_store/src/blocs/Statistic/statistic_bloc.dart';
import 'package:flower_store/src/blocs/Statistic/statistic_event.dart';
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
  late StatisticBloc bloc;
  @override
  void initState() {
    bloc = context.read<StatisticBloc>();
    bloc.add(StatisticLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticBloc(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Chart(isInvoice: true),
              SizedBox(
                height: 15.h,
              ),
              Chart(isInvoice: false),
            ],
          ),
        ),
      ),
    );
  }
}
