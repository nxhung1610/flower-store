
import 'package:flower_store/src/blocs/statistic/statistic_state.dart';
import 'package:flower_store/src/utils/components/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flower_store/src/blocs/Statistic/statistic_bloc.dart';
import 'package:flower_store/src/blocs/Statistic/statistic_event.dart';
import 'package:flower_store/src/screens/dashboard/statistical/widget/revenue_item_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';

class StatisticalPage extends StatefulWidget {
  StatisticalPage({
    Key? key,
  }) : super(key: key);

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
    return BlocBuilder<StatisticBloc, StatisticState>(
      builder: (context, state) {
        if (state is StatisticLoadSucess) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          );
        } else if (state is StatisticLoading) {
          return SizedBox.expand(
            child: Center(
              child: LoadingWidget(),
            ),
          );
        } else {
          return SizedBox.expand();
        }
      },
    );
  }
}
