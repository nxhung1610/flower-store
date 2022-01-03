import 'package:flower_store/src/blocs/statistic/statistic_bloc.dart';
import 'package:flower_store/src/screens/dashboard/statistical/widget/line_chart_widget.dart';
import 'package:flower_store/src/utils/components/error_widget.dart';
import 'package:flower_store/src/utils/components/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Container(
      width: double.infinity,
      child: BlocBuilder<StatisticBloc, StatisticState>(
        builder: (context, state) {
          if (state is StatisticLoadSucess) {
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 0.4.sh,
                    child: LineChartWidget(
                      data: state.billMap[state.selectYear]!,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.h),
                    child: Row(
                      children: [
                        Text(
                          'Detail(s)',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.header5.copyWith(
                            color: AppColors.color6,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(child: Container()),
                        DropdownButton<int>(
                          items: state.billMap.keys
                              .map((e) => DropdownMenuItem<int>(
                                    value: e,
                                    child: Text(
                                      e.toString(),
                                      style: AppTextStyle.header5.copyWith(
                                        color: AppColors.color6,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: state.selectYear,
                          onChanged: (value) async {
                            if (value != null)
                              bloc.add(StatisticChangeYear(year: value));
                          },
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.billMap[state.selectYear]!.values.length,
                    itemBuilder: (context, index) => RevenueItemWidget(
                        bills: state.billMap[state.selectYear]!.values
                            .toList()[index],
                        dateTime: DateTime(
                            state.selectYear,
                            state.billMap[state.selectYear]!.keys
                                .toList()[index])),
                  ),
                ],
              ),
            );
          } else if (state is StatisticLoading) {
            return SizedBox.expand(
              child: Center(
                child: LoadingWidget(),
              ),
            );
          } else if (state is StatisticalLoadFail) {
            return Center(
              child: CustomErrorWidget(
                message: (state).message,
              ),
            );
          } else {
            return SizedBox.expand();
          }
        },
      ),
    );
  }
}
