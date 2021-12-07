import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitRing(
          lineWidth: 4.5.sp,
          size: 40.sp,
          color: AppColors.color1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Loading...',
          style: AppTextStyle.header5.copyWith(
            color: AppColors.color3,
            fontStyle: FontStyle.normal,
          ),
        )
      ],
    );
  }
}
