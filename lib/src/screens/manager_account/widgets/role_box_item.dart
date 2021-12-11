import 'package:flower_store/src/blocs/bloc.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleBoxItem extends StatefulWidget {
  final RoleType role;
  final bool isPadding;
  RoleBoxItem({Key? key, required this.role, this.isPadding = false})
      : super(key: key);

  @override
  _RoleBoxItemState createState() => _RoleBoxItemState();
}

class _RoleBoxItemState extends State<RoleBoxItem> {
  @override
  Widget build(BuildContext context) {
    final role = this.widget.role;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widget.isPadding ? 65.w : 13.w,
          vertical: widget.isPadding ? 14.h : 4.h),
      decoration: BoxDecoration(
        color: _colorFromRole(context),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Center(
        child: Text(
          role.toString().split(".")[1],
          style: AppTextStyle.header5
              .copyWith(color: AppColors.color10, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Color _colorFromRole(BuildContext context) {
    var role = BlocProvider.of<ManagerAccountBloc>(context)
        .roles
        .where((element) => element.type == widget.role.index)
        .first;
    return Color(int.parse(role.color, radix: 16)).withOpacity(0.5);
  }
}
