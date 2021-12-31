import 'package:fl_chart/fl_chart.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _LineChart extends StatelessWidget {
  final Map _request;
  final Map _invoice;
  _LineChart(this._request, this._invoice);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      Data,
    );
  }

  LineChartData get Data => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: 11,
        minY: 0,
      );

  LineTouchData get lineTouchData => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            return value.toString() + 'K';
          },
        ),
      );

  List<LineChartBarData> get lineBarsData => [
        invoiceLine,
        requestLine,
      ];

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        margin: 8,
        interval: 150000,
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

  double getSpot(Map map, int index) {
    if (map.isEmpty) return 0;

    double result = map[index + 1] != null ? map[index + 1] * 1.0 : 0.0;

    return result;
  }

  LineChartBarData get invoiceLine => LineChartBarData(
        isCurved: false,
        colors: [AppColors.color10],
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: [
          FlSpot(0, getSpot(_invoice, 0)),
          FlSpot(1, getSpot(_invoice, 1)),
          FlSpot(2, getSpot(_invoice, 2)),
          FlSpot(3, getSpot(_invoice, 3)),
          FlSpot(4, getSpot(_invoice, 4)),
          FlSpot(5, getSpot(_invoice, 5)),
          FlSpot(6, getSpot(_invoice, 6)),
          FlSpot(7, getSpot(_invoice, 7)),
          FlSpot(8, getSpot(_invoice, 8)),
          FlSpot(9, getSpot(_invoice, 9)),
          FlSpot(10, getSpot(_invoice, 10)),
          FlSpot(11, getSpot(_invoice, 11)),
        ],
      );

  LineChartBarData get requestLine => LineChartBarData(
        isCurved: false,
        colors: const [AppColors.color7],
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: true),
        spots: [
          FlSpot(0, getSpot(_request, 0)),
          FlSpot(1, getSpot(_request, 1)),
          FlSpot(2, getSpot(_request, 2)),
          FlSpot(3, getSpot(_request, 3)),
          FlSpot(4, getSpot(_request, 4)),
          FlSpot(5, getSpot(_request, 5)),
          FlSpot(6, getSpot(_request, 6)),
          FlSpot(7, getSpot(_request, 7)),
          FlSpot(8, getSpot(_request, 8)),
          FlSpot(9, getSpot(_request, 9)),
          FlSpot(10, getSpot(_request, 10)),
          FlSpot(11, getSpot(_request, 11)),
        ],
      );
}

class LineChartSample1 extends StatefulWidget {
  final Map request;
  final Map invoice;
  LineChartSample1({Key? key, required this.request, required this.invoice})
      : super(key: key);

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
                child: _LineChart(widget.request, widget.invoice),
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
