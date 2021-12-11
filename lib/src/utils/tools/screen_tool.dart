import 'package:flower_store/src/utils/components/loading_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenTool {
  const ScreenTool._();

  static const Size defaultSize = const Size(411, 823);

  static BuildContext? _dialogContext;

  /// [BuildContext] The context of screen to show up loading
  /// [bool] true for show loading, false to close
  static void showLoading(BuildContext context, bool show) {
    if (show) {
      final dialogLoading = Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: LoadingWidget(),
        ),
      );
      showDialog(
        context: context,
        builder: (context) {
          _dialogContext = context;
          return dialogLoading;
        },
      );
    } else {
      if (_dialogContext != null) Navigator.pop(_dialogContext!);
    }
  }

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
