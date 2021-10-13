import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstant {
  static const String baseUrl = '';

  static final shadowProduct = BoxShadow(
    color: AppColors.color5.withOpacity(0.05),
    blurRadius: 20.w,
    spreadRadius: 0,
    offset: Offset(0, 8.w),
  );
}
