import 'package:fl_chart/fl_chart.dart';

import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
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
          color: AppColors.color2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Monthly Report",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          AspectRatio(
            aspectRatio: 1.7,
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 5, left: 5, top: 8, bottom: 10),
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
          interval: 1,
          showTitles: true,
          reservedSize: 12,
          getTextStyles: (context, value) => const TextStyle(
              color: AppColors.color10,
              fontWeight: FontWeight.bold,
              fontSize: 16),
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
              case 12:
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
            fontSize: 13,
          ),
          getTitles: (value) {
            return value.toString();
          },
          interval: 1,
          margin: 12,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: AppColors.color10, width: 1),
      ),
      minX: 0,
      minY: 0,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
          ],
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.5),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.5),
          ]),
        ),
      ],
    );
  }
}
