import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailBillStaff extends StatelessWidget {
  const DetailBillStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.h,
      width: 345.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Container(
                      child: Text(
                        '#1234',
                        style: AppTextStyle.header6.copyWith(
                            color: AppColors.color6,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 20),
                    child: Container(
                      child: Text(
                        'Jul 1, 2021',
                        style: AppTextStyle.header6.copyWith(
                            color: AppColors.color7,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 19.99.h,
              ),
              Container(
                width: 300.w,
                height: 0.5.h,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: SvgPicture.asset(
                          'assets/ico_staffs.svg',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 23.89, top: 15),
                        child: Container(
                          child: Text(
                            'Staff',
                            style: AppTextStyle.header6.copyWith(
                                color: AppColors.color6,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 20),
                    child: Container(
                      child: Text(
                        'idStaff',
                        style: AppTextStyle.header6.copyWith(
                            color: AppColors.color7,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      child: Text(
                        'Staff name',
                        style: AppTextStyle.header6.copyWith(
                            color: AppColors.color2,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 34.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SvgPicture.asset(
                          'assets/ico_customer.svg',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17.2),
                        child: Container(
                          child: Text(
                            'Customer',
                            style: AppTextStyle.header6.copyWith(
                                color: AppColors.color6,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      child: Text(
                        'Customer name',
                        style: AppTextStyle.header6.copyWith(
                            color: AppColors.color2,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      child: Text(
                        'Phone',
                        style: AppTextStyle.header6.copyWith(
                            color: AppColors.color6,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 5),
                    child: Container(
                      child: Text(
                        'Email',
                        style: AppTextStyle.header6.copyWith(
                            color: AppColors.color6,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
