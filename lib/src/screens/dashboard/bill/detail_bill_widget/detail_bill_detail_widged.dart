import 'package:flower_store/src/screens/dashboard/bill/detail_bill_widget/detail_bill_expandable_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailBillDetailWidget extends StatelessWidget {
  const DetailBillDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 345,
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
                    padding: const EdgeInsets.only(left: 18, top: 18),
                    child: Text(
                      'Detail',
                      style: AppTextStyle.header5.copyWith(
                        color: AppColors.color6,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 17, top: 17),
                    child: SvgPicture.asset(
                      'assets/ico_downs.svg',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: 7,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 0,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      width: 345,
                      child: Card(
                        color: AppColors.color10,
                        elevation: 0,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 2),
                                    child: Image(
                                      width: 50.w,
                                      height: 50.h,
                                      image: AssetImage(
                                          'assets/template_plant.png'),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 21),
                                        child: Text(
                                          'Chậu Hana',
                                          style: AppTextStyle.header6.copyWith(
                                            color: AppColors.color6,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 5),
                                        child: Text(
                                          '10 000 VND',
                                          style: AppTextStyle.header7.copyWith(
                                            color: AppColors.color7,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 22, top: 22),
                                        child: Text(
                                          '(x3)',
                                          style: AppTextStyle.header7.copyWith(
                                            color: AppColors.color3,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6, right: 21),
                                        child: Text(
                                          '30,000 VND',
                                          style: AppTextStyle.header7.copyWith(
                                            color: AppColors.color6,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
