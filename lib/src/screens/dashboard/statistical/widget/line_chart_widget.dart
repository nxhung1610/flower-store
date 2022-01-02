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

class LineChartWidget extends StatelessWidget {
  final Map<int, List<Bill>> data;

  const LineChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Map<int, List<Bill>>> mapDataBill = {};
    data.entries.forEach((element) {
      if (mapDataBill.containsKey(element.key)) {
        element.value
            .groupListsBy((element) => element.createdAt!.day)
            .forEach((keyChild, valueChild) {
          if (mapDataBill[element.key]!.containsKey(keyChild)) {
            mapDataBill[element.key]![keyChild]!.addAll(valueChild);
          } else {
            mapDataBill[element.key]![keyChild] = valueChild;
          }
        });
      } else {
        mapDataBill[element.key] =
            element.value.groupListsBy((element) => element.createdAt!.day);
      }
    });

    List<FlSpot> pointsRequest = [];
    List<FlSpot> pointsInvoice = [];
    mapDataBill.forEach((month, groupDay) {
      groupDay.forEach((day, bills) {
        final requests = bills.where((element) => element is Request);
        if (requests.isNotEmpty) {
          pointsRequest.add(
            FlSpot(
              month + day / 30,
              requests.map((e) => e.totalPrice!).sum.toDouble(),
            ),
          );
        }

        final invoices = bills.where((element) => element is Invoice);
        if (invoices.isNotEmpty) {
          pointsInvoice.add(
            FlSpot(
              month + day / 30,
              invoices.map((e) => e.totalPrice!).sum.toDouble(),
            ),
          );
        }
      });
    });

    pointsRequest.sort((a, b) => a.x.compareTo(b.x));
    pointsInvoice.sort((a, b) => a.x.compareTo(b.x));

    final minX = data.keys.sorted((a, b) => a.compareTo(b)).first.toDouble();
    final maxX = data.keys.sorted((a, b) => a.compareTo(b)).last.toDouble() + 1;
    final minY = [
      ...pointsRequest.map((e) => e.y),
      ...pointsInvoice.map((e) => e.y)
    ].reduce(min).toDouble();
    final maxY = [
          ...pointsRequest.map((e) => e.y),
          ...pointsInvoice.map((e) => e.y)
        ].reduce(max).toDouble() +
        10000;

    return Container(
      color: AppColors.color3,
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: 10.h,
        right: 30.w,
        left: 20.w,
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: AppColors.color10,
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: AppColors.color10,
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: AppColors.color10),
          ),
          minX: minX,
          maxX: maxX,
          minY: minY,
          maxY: maxY,
          titlesData: getTitleData(),
          lineBarsData: [
            LineChartBarData(
              dotData: FlDotData(
                show: false,
              ),
              // ignore: unnecessary_cast
              spots: pointsRequest,
              colors: [AppColors.color10],
              barWidth: 3.w,
            ),
            LineChartBarData(
              dotData: FlDotData(
                show: false,
              ),
              // ignore: unnecessary_cast
              spots: pointsInvoice,
              colors: [AppColors.color10],
              barWidth: 3.w,
            )
          ],
        ),
        swapAnimationDuration: Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear,
      ),
    );
  }

  static getTitleData() => FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          getTextStyles: (context, value) => AppTextStyle.header6.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.color10,
          ),
          showTitles: true,
          interval: 1,
          getTitles: (value) {
            return DateFormat('MMM').format(DateTime(0, value.toInt()));
          },
        ),
        leftTitles: SideTitles(
          reservedSize: 35.w,
          interval: 20000,
          getTextStyles: (context, value) => AppTextStyle.header6.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.color10,
          ),
          showTitles: true,
        ),
      );
}
