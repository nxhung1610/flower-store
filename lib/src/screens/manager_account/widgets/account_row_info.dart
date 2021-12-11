import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountRowInfo extends StatelessWidget {
  final Widget icon;
  final Function(String value) onChanged;

  bool isNameReadOnly = true;
  final String hintText;
  final TextInputType intputType;
  AccountRowInfo(
      {Key? key,
      required this.onChanged,
      required this.icon,
      this.hintText = '',
      this.intputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        children: [
          SizedBox(
            height: 25.h,
            width: 25.h,
            child: icon,
          ),
          Expanded(child: Container()),
          IntrinsicWidth(
            child: TextField(
              textAlign: TextAlign.right,
              keyboardType: intputType,
              onChanged: (value) => onChanged(value),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
              style: AppTextStyle.header5.copyWith(
                color: AppColors.color6,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
