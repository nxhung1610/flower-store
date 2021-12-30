import 'package:fl_chart/fl_chart.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _LineChart extends StatelessWidget {
  const _LineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData2,
    );
  }

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 0,
        maxX: 11,
        minY: 0,
      );

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            return value.toString();
          },
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
        lineChartBarData2_3,
      ];

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        margin: 8,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => const TextStyle(
          color: AppColors.color10,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 12,
        margin: 8,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: AppColors.color10,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '1';
            case 1:
              return '2';
            case 2:
              return '3';
            case 3:
              return '4';
            case 4:
              return '5';
            case 5:
              return '6';
            case 6:
              return '7';
            case 7:
              return '8';
            case 8:
              return '9';
            case 9:
              return '10';
            case 10:
              return '11';
            case 11:
              return '12';
          }
          return '';
        },
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
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
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: AppColors.color10,
          ),
          left: BorderSide(
            color: AppColors.color10,
          ),
          right: BorderSide(
            color: AppColors.color10,
          ),
          top: BorderSide(
            color: AppColors.color10,
          ),
        ),
      );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
        isCurved: true,
        colors: [AppColors.color10],
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 1),
          FlSpot(1, 4),
          FlSpot(2, 1.8),
          FlSpot(3, 5),
          FlSpot(4, 2),
          FlSpot(5, 2.2),
          FlSpot(6, 1),
          FlSpot(7, 4),
          FlSpot(8, 1.8),
          FlSpot(9, 5),
          FlSpot(10, 2),
          FlSpot(11, 2.2),
        ],
      );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
        isCurved: true,
        colors: const [AppColors.color7],
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: true),
        spots: const [
          FlSpot(0, 0),
          FlSpot(1, 1.9),
          FlSpot(2, 5),
          FlSpot(3, 3.3),
          FlSpot(4, 3.8),
          FlSpot(5, 1.9),
          FlSpot(6, 5),
          FlSpot(7, 3.3),
          FlSpot(8, 3.8),
          FlSpot(9, 1.9),
          FlSpot(10, 5),
          FlSpot(11, 3.3),
        ],
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: AppColors.color2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10.h,
            ),
            const Text(
              'Invoice Monthly Report',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.color10,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15, top: 8, bottom: 10),
                child: _LineChart(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
