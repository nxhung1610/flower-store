import 'package:flower_store/src/blocs/auth/auth_bloc.dart';
import 'package:flower_store/src/screens/base/screen_config.dart';
import 'package:flower_store/src/screens/main/main_screen.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flower_store/src/utils/tools/screen_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PincodeScreen extends StatefulWidget {
  static const String nameRoute = '/pincode';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => PincodeScreen(),
      settings: RouteSettings(name: nameRoute),
    );
  }

  PincodeScreen({Key? key}) : super(key: key);

  @override
  _PincodeScreenState createState() => _PincodeScreenState();
}

class _PincodeScreenState extends State<PincodeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenConfig(
      builder: () => BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthRequestValidating) {
            ScreenTool.showLoading(context, true);
          } else if (state is AuthRequestSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, MainScreen.nameRoute, (route) => false);
          } else if (state is AuthRequestFail) {}
        },
        child: Scaffold(
          body: SafeArea(
            child: _BodyScreen(),
          ),
        ),
      ),
    );
  }
}

class _BodyScreen extends StatefulWidget {
  const _BodyScreen({Key? key}) : super(key: key);

  @override
  State<_BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<_BodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 170.h,
          ),
          Text(
            'Enter Your Pincode',
            style: AppTextStyle.header3.copyWith(
              color: AppColors.color6,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 56.w),
            child: PinCodeTextField(
              appContext: context,
              length: 5,
              pinTheme: PinTheme(
                activeColor: AppColors.color2,
                selectedColor: AppColors.color2,
                inactiveColor: AppColors.color2,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.all(Radius.circular(5.w)),
                borderWidth: 3.w,
              ),
              showCursor: false,
              keyboardType: TextInputType.number,
              animationType: AnimationType.none,
              onChanged: (value) {},
              onCompleted: (value) {
                BlocProvider.of<AuthBloc>(context)
                    .add(AuthPincodeValidateEvent(pincode: value));
              },
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Use another device?',
                style: AppTextStyle.header6.copyWith(color: AppColors.color8),
              ),
              SizedBox(
                width: 8.w,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Logout',
                  style: AppTextStyle.header6.copyWith(
                    color: AppColors.color1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
