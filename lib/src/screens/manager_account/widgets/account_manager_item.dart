import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/utils/components/shimmer_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'role_box_item.dart';

class AccountManagerItem extends StatelessWidget {
  final Staff staff;
  List<Role>? roles = [];
  AccountManagerItem({Key? key, required this.staff, this.roles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10.sp),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              height: 50.w,
              width: 50.w,
              imageUrl: staff.url,
              placeholder: (context, url) => ShimmerWidget(
                height: 50.w,
                width: 50.w,
                shape: const CircleBorder(),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  color: AppColors.color9,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Text(
                staff.name,
                style: AppTextStyle.header5.copyWith(
                  color: AppColors.color6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              padding: EdgeInsets.all(10.w),
              child: RoleBoxItem(role: staff.role),
            )
          ],
        ),
      ),
    );
  }
}
