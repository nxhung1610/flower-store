import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemActionFunction extends StatelessWidget {
  final VoidCallback listener;
  final Widget icon;
  final String title;
  const ItemActionFunction(
      {Key? key,
      required this.listener,
      required this.icon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: () async {
        await Future.delayed(Duration(milliseconds: 500));
        listener();
      },
      child: Container(
        padding: EdgeInsets.all(17.w),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: icon,
              ),
            ),
            SizedBox(width: 17.w),
            Expanded(
              flex: 4,
              child: Text(
                title,
                style: AppTextStyle.header5.copyWith(
                  color: AppColors.color6,
                  fontStyle: FontStyle.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
