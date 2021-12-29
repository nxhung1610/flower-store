import 'package:another_flushbar/flushbar.dart';
import 'package:flower_store/src/blocs/cart/cart_bloc.dart';
import 'package:flower_store/src/blocs/cart/cart_state.dart';
import 'package:flower_store/src/screens/dashboard/cart/widgets/product_in_cart_widget.dart';
import 'package:flower_store/src/screens/dashboard/checkout/checkout_page.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';

class CartPage extends StatelessWidget {
  static const String nameRoute = '/cart';
  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => CartPage(),
      settings: settings,
    );
  }

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          size: 23.w,
          color: AppColors.color7,
        ),
        centerTitle: true,
        backgroundColor: AppColors.color10,
        title: Text(
          'My Cart',
          style: AppTextStyle.header4
              .copyWith(fontWeight: FontWeight.bold, color: AppColors.color7),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(10.h),
                    physics: BouncingScrollPhysics(),
                    itemCount: state.cartProducts.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 10.h),
                    itemBuilder: (context, index) {
                      return ProductInCartWidget(
                        cartProduct: state.cartProducts[index],
                      );
                    },
                  ),
                ),
                Divider(
                  color: AppColors.color9,
                  height: 1.h,
                ),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 500,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total : " +
                              state.cartProducts
                                  .map((e) => e.basePrice * e.quantity)
                                  .sum
                                  .toString() +
                              " VND",
                          style: AppTextStyle.header5.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.color2),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: AppColors.color3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.h),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            await Future.delayed(Duration(milliseconds: 300));
                            if (state.cartProducts.isNotEmpty)
                              Navigator.pushNamed(
                                  context, CheckOutPage.nameRoute,
                                  arguments: state.cartProducts);
                            else
                              Flushbar(
                                  message: 'Please choose one product',
                                  duration: Duration(
                                    milliseconds: 1000,
                                  )).show(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.h,
                              horizontal: 25.w,
                            ),
                            child: Text(
                              "CHECKOUT",
                              style: AppTextStyle.header6.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.color10),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
