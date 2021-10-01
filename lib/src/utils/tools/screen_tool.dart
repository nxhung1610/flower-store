import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTool {
  const ScreenTool._();

  static const Size defaultSize = const Size(411, 823);

  static void init(
    BoxConstraints constraints, {
    Size designSize = defaultSize,
  }) {
    ScreenUtil.init(
      constraints,
      designSize: designSize,
    );
  }
}
