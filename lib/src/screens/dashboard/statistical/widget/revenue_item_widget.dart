import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InvoiceReport extends StatelessWidget {
  
  const InvoiceReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: AppColors.color4,
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.w),
            child: Row(
              children: [
                Text(
                  'July 2021',
                  style: AppTextStyle.header6.copyWith(
                      color: AppColors.color7, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 22.w, right: 16.w, top: 20.h, bottom: 10.h),
            child: Row(
              children: [
                SvgPicture.asset('assets/ico_upIncome.svg'),
                SizedBox(
                  width: 11.w,
                ),
                Expanded(
                  child: Text(
                    'Icome',
                    style: AppTextStyle.header6.copyWith(
                        color: AppColors.color5, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  '+ 1000000 VND',
                  style: AppTextStyle.header6.copyWith(
                    color: AppColors.color8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 22.w, right: 16.w, top: 10.h, bottom: 33.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/ico_downIncome.svg',
                ),
                SizedBox(
                  width: 11.w,
                ),
                Expanded(
                  child: Text(
                    'Expenditure',
                    style: AppTextStyle.header6.copyWith(
                        color: AppColors.color5, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  '- 800000 VND',
                  style: AppTextStyle.header6.copyWith(
                    color: AppColors.color8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
