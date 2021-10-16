import 'package:flower_store/src/screens/dashboard/home/widget/product_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackagePage extends StatefulWidget {
  PackagePage({Key? key}) : super(key: key);

  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: Container(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: 5 + 2,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 20.h),
          itemBuilder: (context, index) {
            if (index == 0 || index == 5 + 1) {
              return Container(); // zero height: not visible
            }
            return ProductWidget(page: pageOfWidget.PACKAGE);
          },
        ),
      ),
    );
  }
}
