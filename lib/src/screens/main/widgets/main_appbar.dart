import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends AppBar {
  final BuildContext? context;
  MainAppBar({
    Key? key,
    Widget? title,
    this.context,
  }) : super(
          key: key,
          title: title,
          centerTitle: true,
          elevation: 1,
          backgroundColor: AppColors.color9,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/ico_menu.svg'),
          ),
          actions: [],
        );
}
