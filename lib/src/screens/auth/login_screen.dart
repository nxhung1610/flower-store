import 'package:flower_store/src/screens/auth/pincode_screen.dart';
import 'package:flower_store/src/screens/base/screen_config.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
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
    return ScreenConfig(
      builder: () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: _BodyScreen(),
      ),
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
            bottom: MediaQuery.of(context).viewInsets.bottom - 100.h,
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
                  'Sign In',
                  style: AppTextStyle.header2.copyWith(
                    color: AppColors.color5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: _DeviceCodeInput(),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 246.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.color1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _gotoPincodeScreen(context),
                    child: Text(
                      'Login',
                      style: AppTextStyle.header5.copyWith(
                        color: AppColors.color9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 57.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _gotoPincodeScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, PincodeScreen.nameRoute, (route) => false);
  }
}

class _DeviceCodeInput extends StatelessWidget {
  const _DeviceCodeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorWidth: 2.w,
      cursorRadius: Radius.elliptical(10, 10),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          borderSide: BorderSide(
            color: AppColors.color8,
            width: 2.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          borderSide: BorderSide(
            color: AppColors.color8,
            width: 2.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          borderSide: BorderSide(
            color: AppColors.color2,
            width: 2.w,
          ),
        ),
        hintText: 'Device Code',
        hintStyle: AppTextStyle.header5.copyWith(
          color: AppColors.color8,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: AppTextStyle.header5.copyWith(
        color: AppColors.color5,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _BottomPaint extends StatelessWidget {
  const _BottomPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 220.h,
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
    paint.color = AppColors.color2;
    paint.style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(160.w, 20.h, 236.w, 220.h);
    path.lineTo(236.w + 48.w, 220.h);
    path.quadraticBezierTo(320.w, 120.h, 1.sw, 104.h);
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
