import 'package:flower_store/src/utils/components/shimmer_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AccountManagerItemShimmer extends StatelessWidget {
  const AccountManagerItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShimmerWidget(
            
            height: 50.w,
            width: 50.w,
            shape: const CircleBorder(),
          ),
          SizedBox(
            width: 10.w,
          ),
          ShimmerWidget(
            height: 15.w,
            width: 0.8.sw,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.sp))),
          ),
        ],
      ),
    );
  }
}
