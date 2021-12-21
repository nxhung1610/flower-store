import 'package:expandable/expandable.dart';
import 'package:flower_store/src/blocs/checkout/checkout_bloc.dart';
import 'package:flower_store/src/models/base/bill/detail_bill.dart';
import 'package:flower_store/src/screens/dashboard/bill/widgets/product_detail_bill.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class DetailBillExpandable extends StatelessWidget {
  final List<DetailBill> details;

  const DetailBillExpandable({Key? key, required this.details})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: details.length,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 10.h),
          itemBuilder: (context, index) =>
              ProductDetailBill(detailBill: details[index]),
        ),
      ],
    );
  }
}
