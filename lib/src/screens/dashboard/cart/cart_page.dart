import 'package:flower_store/src/screens/dashboard/cart/cart_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          size: 23.w,
          color: AppColors.color7,
        ),
        centerTitle: true,
        backgroundColor: AppColors.color10,
        title: Text(
          'My Cart',
          style: AppTextStyle.header4
              .copyWith(fontWeight: FontWeight.bold, color: AppColors.color7),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  return CartWidget();
                },
              ),
            ),
            Card(
              margin: EdgeInsets.zero,
              elevation: 500,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total : 90.000 VND",
                      style: AppTextStyle.header5.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.color2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.color3,
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.h))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 25.w,
                        ),
                        child: Text(
                          "CHECKOUT",
                          style: AppTextStyle.header6.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.color10),
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
    );
  }
}
