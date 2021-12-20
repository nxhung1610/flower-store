import 'package:fl_chart/fl_chart.dart';
import 'package:flower_store/src/blocs/bill/bill_bloc.dart';
import 'package:flower_store/src/blocs/bill/bill_event.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late BillBloc bloc;
  @override
  void initState() {
    bloc = context.read<BillBloc>();
    bloc.add(BillLoaded());
    super.initState();
  }

  List<Color> gradientColors = [
    AppColors.color10,
    AppColors.color10,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          color: AppColors.color1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Monthly Report",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 10.0, left: 10.0, top: 8, bottom: 10),
              child: LineChart(
                monthChart(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData monthChart() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: AppColors.color10,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColors.color10,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          interval: 3,
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) => const TextStyle(
              color: AppColors.color10,
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'JAN';
              case 2:
                return 'FEB';
              case 3:
                return 'MAR';
              case 4:
                return 'APR';
              case 5:
                return 'MAY';
              case 6:
                return 'JUN';
              case 7:
                return 'JUL';
              case 8:
                return 'AUG';
              case 9:
                return 'SEP';
              case 10:
                return 'OCT';
              case 11:
                return 'NOV';
              case 12:
                return 'DEC';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: AppColors.color10,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            return value.toString();
          },
          reservedSize: 25,
          interval: 6,
          margin: 12,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(
          show: true, border: Border.all(color: AppColors.color10, width: 1)),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2.44),
            FlSpot(4.9, 6.44),
            FlSpot(6.8, 2.44),
            FlSpot(8, 4.44),
            FlSpot(9.5, 5.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
