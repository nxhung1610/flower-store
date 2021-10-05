import 'package:flower_store/src/utils/tools/screen_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenConfig extends StatelessWidget {
  const ScreenConfig({
    Key? key,
    required this.builder,
    this.designSize = ScreenTool.defaultSize,
  }) : super(key: key);

  final Widget Function() builder;

  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth != 0) {
        ScreenTool.init(
          constraints,
          designSize: this.designSize,
        );
      }
      return builder();
    });
  }
}
