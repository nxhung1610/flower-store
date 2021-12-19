import 'package:expandable/expandable.dart';
import 'package:flower_store/src/blocs/checkout/checkout_bloc.dart';
import 'package:flower_store/src/screens/dashboard/bill/widgets/product_detail_bill.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class DetailBillExpandable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) => ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.detailBills.length,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 10.h),
              itemBuilder: (context, index) =>
                  ProductDetailBill(detailBill: state.detailBills[index])),
        ),
      ],
    );
  }
}
