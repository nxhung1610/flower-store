import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData AppTheme() {
  return ThemeData(
    primaryColor: AppColors.color2,
    primaryColorLight: AppColors.color3,
    primaryColorDark: AppColors.color1,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: AppColors.color9,
    fontFamily: 'Montserrat',
  );
}
