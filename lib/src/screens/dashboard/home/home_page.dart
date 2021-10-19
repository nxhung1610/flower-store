import 'package:flower_store/app.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_product_page.dart';
import 'widget/product_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            return ProductWidget(
              funcLongPress: () {
                printLog('Đã long press');
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: SvgPicture.asset('assets/ico_plus.svg'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProductPage()),
            );
          },
        ),
        backgroundColor: AppColors.color2,
      ),
    );
  }
}
