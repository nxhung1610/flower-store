import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../update_product_page.dart';

enum pageOfWidget { HOME, PACKAGE, NOEDIT }

class ProductWidget extends StatelessWidget {
  final pageOfWidget page;
  const ProductWidget({
    key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(boxShadow: [AppConstant.shadowProduct]),
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
                            page == pageOfWidget.HOME
                                ? IconButton(
                                    constraints: BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                    iconSize: 17.w,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateProductPage(),
                                        ),
                                      );
                                    },
                                    icon:
                                        SvgPicture.asset('assets/ico_edit.svg'))
                                : Container()
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
                      page == pageOfWidget.HOME
                          ? Container(
                              child: Column(
                                children: [
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
                            )
                          : Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 32.h,
                                  ),
                                  Row(
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints.tightFor(
                                            width: 82.w, height: 30.h),
                                        child: TextButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          26.0),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(AppColors.color3),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              "Update",
                                              style: AppTextStyle.header7
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors.color10),
                                            )),
                                      ),
                                      SizedBox(
                                        width: 43.w,
                                      ),
                                      Text('Remain : 4',
                                          style: AppTextStyle.header7.copyWith(
                                              color: AppColors.color6))
                                    ],
                                  )
                                ],
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
