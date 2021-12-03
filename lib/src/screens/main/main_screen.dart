import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/blocs/bloc.dart';
import 'package:flower_store/src/screens/base/screen_config.dart';
import 'package:flower_store/src/screens/screen.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  static const String nameRoute = '/main';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => MainScreen(),
      settings: RouteSettings(name: nameRoute),
    );
  }

  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return BlocProvider<DashboardBloc>(
            create: (context) => DashboardBloc(),
            child: DashboardScreen(),
          );
        } else if (state is AuthenticationNotAuthenticated ||
            state is AuthenticationFailure) {
          return BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(authBloc: context.read<AuthBloc>()),
            child: LoginScreen(),
          );
        } else {
          return _LoadingScreen();
        }
      },
    );
  }
}

class _LoadingScreen extends StatefulWidget {
  _LoadingScreen({Key? key}) : super(key: key);

  @override
  __LoadingScreenState createState() => __LoadingScreenState();
}

class __LoadingScreenState extends State<_LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.color10,
        height: 1.sh,
        width: 1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCube(
              color: AppColors.color2,
              size: 30.w,
            ),
          ],
        ));
  }
}
