import 'package:flower_store/app.dart';
import 'package:flower_store/src/screens/main/home/widget/product.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ProductWidget();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: SvgPicture.asset('assets/ico_plus.svg'),
          onPressed: () {},
        ),
        backgroundColor: AppColors.color2,
      ),
    );
  }
}
