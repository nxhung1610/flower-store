import 'package:flower_store/src/blocs/checkout/checkout_bloc.dart';
import 'package:flower_store/src/blocs/manager_account/add_account/add_account.dart';
import 'package:flower_store/src/models/cart/cart_product.dart';
import 'package:flower_store/src/screens/base/screen_config.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'form_customer.dart';

class CheckOutPage extends StatefulWidget {
  static const String nameRoute = '/checkout';
  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => CheckOutPage(),
      settings: settings,
    );
  }

  CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    var productList =
        ModalRoute.of(context)!.settings.arguments! as List<CartProduct>;
    return ScreenConfig(
      builder: () => BlocProvider<CheckoutBloc>(
        create: (context) => CheckoutBloc(productsInCart: productList),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            iconTheme: IconThemeData(
              size: 23.w,
              color: AppColors.color7,
            ),
            centerTitle: true,
            backgroundColor: AppColors.color10,
            title: Text(
              'Bill',
              style: AppTextStyle.header4.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.color7),
            ),
          ),
          body: _BodyScreen(),
        ),
      ),
    );
  }
}

class _BodyScreen extends StatefulWidget {
  _BodyScreen({Key? key}) : super(key: key);

  @override
  __BodyScreenState createState() => __BodyScreenState();
}

class __BodyScreenState extends State<_BodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.color4,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _FormCustomer(),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 5.h),
            color: AppColors.color10,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.color3,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.w),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Text(
                    'BILL',
                    style: AppTextStyle.header5.copyWith(
                      color: AppColors.color10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
