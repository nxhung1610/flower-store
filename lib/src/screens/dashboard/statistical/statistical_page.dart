import 'package:flower_store/src/blocs/Statistic/statistic_state.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/utils/tools/screen_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/src/provider.dart';

import 'package:flower_store/src/blocs/Statistic/statistic_bloc.dart';
import 'package:flower_store/src/blocs/Statistic/statistic_event.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/models/base/bill/staff.dart';
import 'package:flower_store/src/screens/dashboard/statistical/widget/invoice_report_widget.dart';
import 'package:flower_store/src/screens/dashboard/statistical/widget/line_chart_widget.dart';
import 'package:flower_store/src/screens/dashboard/statistical/widget/temp_chart.dart';
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
    String staff =
        (context.read<AuthBloc>().state as AuthenticationAuthenticated)
            .staff
            .sId;
    bloc = context.read<StatisticBloc>();
    bloc.add(StatisticLoaded(staff));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatisticBloc, StatisticState>(
      listener: (context, state) {
        if (state is StatisticLoading) {
          ScreenTool.showLoading(context, true);
        }
        if (state is StatisticLoadSucess) {
          ScreenTool.showLoading(context, false);
        }
      },
      builder: (context, state) {
        if (state is StatisticLoadSucess) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: LineChartSample1(
                    request: state.requestMap,
                    invoice: state.invoiceMap,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'Details',
                    style: AppTextStyle.header5.copyWith(
                      color: AppColors.color5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.invoiceMap.length >= state.requestMap.length
                      ? state.invoiceMap.length
                      : state.requestMap.length,
                  itemBuilder: (context, index) {
                    return InvoiceReport();
                  },
                )
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
