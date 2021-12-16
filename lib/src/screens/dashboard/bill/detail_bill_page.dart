import 'package:flower_store/src/screens/dashboard/bill/detail_bill_widget/detail_bill_expandable_widget.dart';
import 'package:flower_store/src/screens/dashboard/bill/detail_bill_widget/detail_bill_info_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailBillPage extends StatelessWidget {
  const DetailBillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.color4,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.color5,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Detail Bill',
            style: AppTextStyle.header4.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.color5,
            ),
          ),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 31.h),
                child: Column(
                  children: [
                    DetailBillStaff(),
                    SizedBox(
                      height: 30,
                    ),
                    DetailBillExpandable(),
                    Container(
                      height: 60.h,
                      width: 345.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 4),
                              child: Text(
                                'Total cost',
                                style: AppTextStyle.header5.copyWith(
                                    color: AppColors.color6,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20, top: 4),
                              child: Text(
                                '120,000 VND',
                                style: AppTextStyle.header5.copyWith(
                                    color: AppColors.color2,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
