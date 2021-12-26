import 'package:flower_store/src/models/package/package.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageItem extends StatelessWidget {
  final Package package;
  const PackageItem({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.color10,
      padding: EdgeInsets.symmetric(vertical: 21.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '#${package.product.sId.replaceRange(5, package.product.sId.length, '...')}',
              style: AppTextStyle.header5.copyWith(
                color: AppColors.color7,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              package.product.name,
              style: AppTextStyle.header5.copyWith(
                color: AppColors.color7,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Text(
              '${package.quantity}',
              style: AppTextStyle.header5.copyWith(
                color: AppColors.color7,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
