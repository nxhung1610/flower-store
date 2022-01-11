import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData AppTheme() {
  return ThemeData(
    primaryColor: AppColors.color2,
    primaryColorLight: AppColors.color3,
    primaryColorDark: AppColors.color1,
    accentColor: AppColors.color3,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: AppColors.color11,
    fontFamily: 'Montserrat',
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.color2,
      selectionColor: AppColors.color3,
      selectionHandleColor: AppColors.color1,
    ),
  );
}
