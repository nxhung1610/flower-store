import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/models/staff.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSliderBar extends StatefulWidget {
  final Staff staff;
  AppSliderBar({Key? key, required this.staff}) : super(key: key);

  @override
  _AppSliderBarState createState() => _AppSliderBarState();
}

class _AppSliderBarState extends State<AppSliderBar> {
  @override
  Widget build(BuildContext context) {
    final staff = widget.staff;
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/background_avatart.png'),
                ),
              ),
              height: 220.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 25.w,
                    bottom: 25.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.color10,
                          radius: 41.5.w,
                          child: Uri.parse(staff.url).isAbsolute
                              ? CachedNetworkImage(
                                  imageUrl: staff.url,
                                  imageBuilder: (context, imageProvider) {
                                    return CircleAvatar(
                                      radius: 41.5.w - 2.w,
                                      backgroundImage: imageProvider,
                                    );
                                  },
                                  errorWidget: (context, url, error) =>
                                      _ErrorAvatar(),
                                )
                              : _ErrorAvatar(),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          staff.name,
                          style: AppTextStyle.header5.copyWith(
                            color: AppColors.color10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          staff.email,
                          style: AppTextStyle.header6.copyWith(
                            color: AppColors.color10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorAvatar extends StatelessWidget {
  const _ErrorAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.color9,
      radius: 41.5.w - 2.w,
      child: SvgPicture.asset(
        'assets/ico_camera.svg',
        height: 20.w,
      ),
    );
  }
}
