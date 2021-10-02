import 'package:flower_store/src/blocs/init/init_bloc.dart';
import 'package:flower_store/src/screens/login/login_screen.dart';
import 'package:flower_store/src/screens/welcome/welcome_screen.dart';
import 'package:flower_store/src/utils/base/screen_config.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitScreen extends StatefulWidget {
  static const String nameRoute = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => InitScreen(),
      settings: RouteSettings(name: nameRoute),
    );
  }

  InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<InitBloc>().add(InitRequestedEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenConfig(
      builder: () => BlocListener<InitBloc, InitState>(
        listener: (context, state) {
          if (state is InitSuccessState) {
            switch ((state).initType) {
              case InitType.welcome:
                Navigator.of(context).pushNamedAndRemoveUntil(
                    WelcomeScreen.nameRoute, (route) => false);
                break;
              case InitType.notlogin:
                Navigator.of(context).pushNamedAndRemoveUntil(
                    LoginScreen.nameRoute, (route) => false);
                break;
              case InitType.hadlogin:
                Navigator.of(context).pushNamedAndRemoveUntil(
                    WelcomeScreen.nameRoute, (route) => false);
                break;
            }
          }
        },
        child: _BodyScreen(),
      ),
    );
  }
}

class _BodyScreen extends StatelessWidget {
  const _BodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.color2,
        height: 1.sh,
        width: 1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icon.svg',
              color: AppColors.color9,
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocSelector<InitBloc, InitState, bool>(
              selector: (state) => state is InitLoadingState,
              builder: (context, isLoading) {
                if (isLoading) {
                  return SpinKitThreeBounce(
                    color: AppColors.color9,
                    size: 30.w,
                  );
                }
                return Container();
              },
            )
          ],
        ));
  }
}
