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
    return ExpandableNotifier(
      child: Column(
        children: <Widget>[
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapHeaderToExpand: true,
                hasIcon: false,
              ),
              header: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Detail',
                      style: AppTextStyle.header5.copyWith(
                        color: AppColors.color6,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: AppColors.color3,
                      child: Container(
                        width: 26.w,
                        height: 28.h,
                        child: Center(
                          child: ExpandableIcon(
                            theme: const ExpandableThemeData(
                              animationDuration: Duration(milliseconds: 500),
                              expandIcon: Icons.arrow_left,
                              collapseIcon: Icons.arrow_drop_down,
                              iconColor: Colors.white,
                              iconSize: 25.0,
                              iconRotationAngle: 0,
                              iconPadding:
                                  EdgeInsets.only(right: 12, bottom: 12),
                              hasIcon: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              collapsed: Text(
                '',
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) => ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.detailBills.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 10.h),
                    itemBuilder: (context, index) => ProductDetailBill(
                        detailBill: state.detailBills[index])),
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
