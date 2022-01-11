import 'package:collection/src/iterable_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/models/request/request.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import "package:collection/collection.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BarChartWidget extends StatelessWidget {
  final Map<int, List<Bill>> data;

  const BarChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroups = [];
    data.forEach((month, bills) {
      List<BarChartRodData> barRods = [];
      final requests = bills.where((element) => element is Request);
      if (requests.isNotEmpty) {
        barRods.add(
          BarChartRodData(
            y: requests.map((e) => e.totalPrice!).sum.toDouble(),
            colors: [AppColors.color9],
            width: 1.sw / 24,
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        );
      }
      final invoices = bills.where((element) => element is Invoice);
      if (invoices.isNotEmpty) {
        barRods.add(
          BarChartRodData(
            y: invoices.map((e) => e.totalPrice!).sum.toDouble(),
            colors: [AppColors.color3],
            width: 1.sw / 24,
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        );
      }

      barGroups.add(BarChartGroupData(x: month, barRods: barRods));
    });

    barGroups.sort((a, b) => a.x.compareTo(b.x));

    final minY = [
          for (BarChartGroupData item in barGroups)
            ...item.barRods.map((e) => e.y),
        ].reduce(min).toDouble() -
        10000;
    final maxY = [
          for (BarChartGroupData item in barGroups)
            ...item.barRods.map((e) => e.y),
        ].reduce(max).toDouble() +
        10000;

    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: 10.h,
        right: 30.w,
        left: 20.w,
      ),
      child: BarChart(
        BarChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: AppColors.color7,
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: AppColors.color7,
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: AppColors.color7,
            ),
          ),
          barGroups: barGroups,
          titlesData: getTitleData((maxY - minY) / 5),
          minY: minY,
          maxY: maxY,
        ),
      ),
    );
  }

  static getTitleData(double interval) => FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          getTextStyles: (context, value) => AppTextStyle.header6.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.color7,
          ),
          showTitles: true,
          interval: 1,
          getTitles: (value) {
            return DateFormat('MMM').format(DateTime(0, value.toInt()));
          },
        ),
        leftTitles: SideTitles(
          reservedSize: 45.w,
          interval: interval,
          getTextStyles: (context, value) => AppTextStyle.header6.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.color7,
          ),
          showTitles: true,
          getTitles: (value) {
            return NumberFormat.compactCurrency(
              decimalDigits: 2,
              symbol:
                  '', // if you want to add currency symbol then pass that in this else leave it empty.
            ).format(value);
          },
        ),
      );
}
