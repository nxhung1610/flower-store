import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/blocs/bloc.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/models/user/manager.dart';
import 'package:flower_store/src/models/base/staff.dart';
import 'package:flower_store/src/screens/dashboard/widgets/item_action_function.dart';
import 'package:flower_store/src/screens/manager_account/manager_account_page.dart';
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
  void initState() {
    context.read<SlideBarMenuBloc>().add(SlideBarMenuInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final staff = widget.staff;
    return Container(
      child: Drawer(
        child: ListView(
          shrinkWrap: true,
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
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.5, 1],
                          colors: <Color>[
                            Colors.transparent,
                            AppColors.color7
                          ], // red to yellow
                        ),
                      ),
                    ),
                  ),
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
                          style: AppTextStyle.header4.copyWith(
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
                            color: AppColors.color9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ActionsFunction(
              staff: staff,
            )
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

class ActionsFunction extends StatelessWidget {
  final Staff staff;
  const ActionsFunction({Key? key, required this.staff}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBLoc = BlocProvider.of<AuthBloc>(context);
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          (staff is Manager)
              ? ItemActionFunction(
                  listener: () {
                    Navigator.pushNamed(context, ManagerAccountPage.nameRoute);
                  },
                  icon: SvgPicture.asset('assets/ico_account_setting.svg'),
                  title: 'Manager Account',
                )
              : Container(),
          (staff is Manager)
              ? ItemActionFunction(
                  listener: () {},
                  icon: SvgPicture.asset('assets/ico_notification.svg'),
                  title: 'Notification Manager',
                )
              : Container(),
          !(staff is Manager)
              ? ItemActionFunction(
                  listener: () {},
                  icon: SvgPicture.asset('assets/ico_notification.svg'),
                  title: 'Notification',
                )
              : Container(),
          (staff is Manager)
              ? ItemActionFunction(
                  listener: () {},
                  icon: SvgPicture.asset('assets/ico_report.svg'),
                  title: 'Reports',
                )
              : Container(),
          (staff is Accountant)
              ? ItemActionFunction(
                  listener: () {},
                  icon: SvgPicture.asset('assets/ico_report.svg'),
                  title: 'Request Reports',
                )
              : Container(),
          ItemActionFunction(
            listener: () {
              authBLoc.add(UserLoggedOut());
            },
            icon: SvgPicture.asset('assets/ico_logout.svg'),
            title: 'Logout',
          ),
        ],
      ),
    );
  }
}
