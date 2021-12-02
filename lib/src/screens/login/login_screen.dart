import 'package:another_flushbar/flushbar.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/blocs/login/login_bloc.dart';
import 'package:flower_store/src/screens/base/screen_config.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flower_store/src/utils/tools/screen_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static const String nameRoute = '/login';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
      settings: RouteSettings(name: nameRoute),
    );
  }

  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return ScreenConfig(
      builder: () => BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(authBloc: authBloc),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginRequestLoading) {
                ScreenTool.showLoading(context, true);
              } else if (state is LoginRequestFail) {
                ScreenTool.showLoading(context, false);
                Flushbar(
                    title: "Login Failed",
                    message: state.message,
                    duration: Duration(
                      milliseconds: 1000,
                    )).show(context);
              } else if (state is LoginRequestSuccess) {
                ScreenTool.showLoading(context, false);
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: _BodyScreen(),
            ),
          )),
    );
  }
}

class _BodyScreen extends StatelessWidget {
  const _BodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: _BottomPaint(),
          ),
          Positioned.fill(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icon.svg',
                    height: 110.h,
                    width: 112.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Welcome',
                    style: AppTextStyle.header2.copyWith(
                      color: AppColors.color6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: _LoginForm(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  bool _isVisiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            color: AppColors.color4,
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            cursorWidth: 2.w,
            cursorRadius: Radius.elliptical(10, 10),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
              border: InputBorder.none,
              hintText: 'Email',
              hintStyle: AppTextStyle.header5.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.color9,
              ),
            ),
            style: AppTextStyle.header5.copyWith(
              color: AppColors.color6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            color: AppColors.color4,
          ),
          child: TextField(
            obscureText: !_isVisiblePassword,
            keyboardType: TextInputType.visiblePassword,
            controller: passWordController,
            cursorWidth: 2.w,
            cursorRadius: Radius.elliptical(10, 10),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
              border: InputBorder.none,
              hintText: 'Password',
              hintStyle: AppTextStyle.header5.copyWith(
                  color: AppColors.color9, fontWeight: FontWeight.w600),
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  _isVisiblePassword = !_isVisiblePassword;
                }),
                icon: Icon(
                  _isVisiblePassword
                      ? Icons.visibility_rounded
                      : Icons.visibility_off,
                  color: AppColors.color9,
                ),
              ),
            ),
            style: AppTextStyle.header5.copyWith(
              color: AppColors.color6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          width: 246.w,
          height: 50.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: AppColors.color1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => context.read<LoginBloc>().add(LoginRequestEvent(
                email: emailController.text,
                password: passWordController.text)),
            child: Text(
              'Login',
              style: AppTextStyle.header5.copyWith(
                color: AppColors.color10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomPaint extends StatelessWidget {
  const _BottomPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 149.h,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: CustomPaint(
              painter: _LoginPaint(),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = AppColors.color3;
    paint.style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(110.w, 20.h, 147.w, 149.h);
    path.lineTo(147.w + 136.w, 220.h);
    path.quadraticBezierTo(300.w, 50.h, 1.sw, 149.h - 104.h);
    path.lineTo(1.sw, 220.h);
    path.lineTo(0, 220.h);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
