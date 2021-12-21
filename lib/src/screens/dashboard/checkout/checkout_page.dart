import 'package:another_flushbar/flushbar.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/blocs/cart/cart_bloc.dart';
import 'package:flower_store/src/blocs/cart/cart_event.dart';
import 'package:flower_store/src/blocs/checkout/checkout_bloc.dart';
import 'package:flower_store/src/blocs/manager_account/add_account/add_account.dart';
import 'package:flower_store/src/models/cart/cart_product.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/screens/base/screen_config.dart';
import 'package:flower_store/src/screens/dashboard/bill/detail_bill_widget/detail_bill_expandable_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flower_store/src/utils/tools/screen_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';

import '../../screen.dart';

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
    final authBloc = context.read<AuthBloc>();
    return ScreenConfig(
      builder: () => BlocProvider<CheckoutBloc>(
        create: (context) =>
            CheckoutBloc(authBloc: authBloc, productsInCart: productList),
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
    final checkoutBloc = context.read<CheckoutBloc>();
    return BlocListener<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        ScreenTool.showLoading(context, state.isLoading);
        if (state.isSuccess) {
          context.read<CartBloc>().add(CartClear());
          Navigator.popUntil(
              context, ModalRoute.withName(MainScreen.nameRoute));
        } else if (state.isError) {
          Flushbar(
              message: state.message,
              duration: Duration(
                milliseconds: 1000,
              )).show(context);
        }
      },
      child: Container(
        color: AppColors.color4,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(25.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ((context.read<AuthBloc>().state
                                      as AuthenticationAuthenticated)
                                  .staff
                                  .role ==
                              RoleType.Seller)
                          ? _FormCustomer()
                          : Container(),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.color10,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        padding: EdgeInsets.all(10.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BlocBuilder<CheckoutBloc, CheckoutState>(
                              builder: (context, state) => DetailBillExpandable(
                                details: state.detailBills,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total cost',
                                  style: AppTextStyle.header5.copyWith(
                                    color: AppColors.color6,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Expanded(child: Container()),
                                BlocBuilder<CheckoutBloc, CheckoutState>(
                                  builder: (context, state) => Text(
                                    '${checkoutBloc.state.detailBills.map((e) => e.totalPrice).reduce((value, element) => value! + element!)!.toInt()} VND',
                                    style: AppTextStyle.header5.copyWith(
                                      color: AppColors.color3,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                  onPressed: () {
                    checkoutBloc.add(BillOrder());
                  },
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
      ),
    );
  }
}
