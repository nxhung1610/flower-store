import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Container(
          padding: EdgeInsets.all(8.w),
          child: Row(
            children: [
              Image(
                  width: 114.w,
                  height: 114.h,
                  image: AssetImage('assets/template_plant.png')),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Chậu Hana',
                              style: AppTextStyle.header6.copyWith(
                                  color: AppColors.color5,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.zero,
                                iconSize: 17.w,
                                onPressed: () {},
                                icon: SvgPicture.asset('assets/ico_edit.svg'))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15.w),
                        child: Text(
                          "Suitable for indoor decoration.\nMatching any decoration styles.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.header7.copyWith(
                            color: AppColors.color5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      Container(
                        child: Text(
                          '30.000 VND',
                          style: AppTextStyle.header6.copyWith(
                            color: AppColors.color5,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
