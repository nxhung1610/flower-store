import 'package:flower_store/src/screens/dashboard/bill/detail_bill_page.dart';
import 'package:flower_store/src/screens/dashboard/bill/widgets/bill_item_row.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillPage extends StatefulWidget {
  BillPage({Key? key}) : super(key: key);

  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color10,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 64,
              width: double.infinity,
              color: AppColors.color3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Container(
                      child: Text(
                        'INVOICE',
                        style: AppTextStyle.header6.copyWith(
                          color: AppColors.color10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'DUE DATE',
                      style: AppTextStyle.header6.copyWith(
                        color: AppColors.color10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Container(
                      child: Text(
                        'BALANCE',
                        style: AppTextStyle.header6.copyWith(
                          color: AppColors.color10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.w,
            ),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 1.h),
                itemBuilder: (context, index) {
                  return BillItem(
                    onClick: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
