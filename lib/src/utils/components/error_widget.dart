import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  const CustomErrorWidget({Key? key, this.message = 'Some errors.'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        message,
        style: AppTextStyle.header5.copyWith(
          color: AppColors.color8,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
