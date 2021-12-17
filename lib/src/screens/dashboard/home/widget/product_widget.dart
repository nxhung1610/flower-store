import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/blocs/cart/cart_bloc.dart';
import 'package:flower_store/src/blocs/cart/cart_event.dart';
import 'package:flower_store/src/blocs/cart/cart_state.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_event.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_bloc.dart';
import 'package:flower_store/src/models/cart/cart_product.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/models/role/role.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../update_product_page.dart';

enum pageOfWidget { HOME, PACKAGE, NOEDIT }

class ProductWidget extends StatelessWidget {
  final pageOfWidget page;
  final RoleType role;
  final Product product;

  const ProductWidget({
    key,
    required this.role,
    required this.page,
    required this.product,
  }) : super(key: key);

  Widget widgetOfHome() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 45.h,
          ),
          Container(
            child: Text(
              product.basePrice.toString() + " VND",
              style: AppTextStyle.header5.copyWith(
                color: AppColors.color6,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget widgetofPackage(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 18.w),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.color3),
                  ),
                  onPressed: () {
                    _showAlertDialog(context);
                  },
                  child: Text(
                    "Update",
                    style: AppTextStyle.header7.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.color10),
                  )),
              Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Text('Remain : 4',
                    style:
                        AppTextStyle.header7.copyWith(color: AppColors.color6)),
              )
            ],
          )
        ],
      ),
    );
  }

  void showBottomDialog(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.color10,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.h),
              topRight: Radius.circular(15.h),
            ),
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Center(
                    child: Container(
                      width: 100.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: AppColors.color3,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.h),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  height: 411.h,
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.w),
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                        errorWidget: (context, url, error) => Image(
                          image: AssetImage('assets/template_plant.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 17.h, top: 6.h, left: 30.w, right: 30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        this.product.name,
                        style: AppTextStyle.header4.copyWith(
                          color: AppColors.color6,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        this.product.description,
                        style: AppTextStyle.header6.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.color8,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        this.product.basePrice.toString() + " VND",
                        style: AppTextStyle.header5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.color2,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 50,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(25.w)),
                          child: Material(
                            child: Container(
                              padding: EdgeInsets.all(7.w),
                              decoration: BoxDecoration(
                                color: AppColors.color3,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.w)),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    constraints: BoxConstraints(),
                                    iconSize: 15.w,
                                    onPressed: () {
                                      BlocProvider.of<CartBloc>(context).add(
                                          CartBottomDialogAmountDecrementPressed());
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/ico_minus.svg'),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  BlocBuilder<CartBloc, CartState>(
                                    builder: (context, state) {
                                      return Text(
                                        state.selectedProduct!.quantity
                                            .toString(),
                                        style: AppTextStyle.header5.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.color10,
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  IconButton(
                                    constraints: BoxConstraints(),
                                    iconSize: 15.w,
                                    onPressed: () {
                                      BlocProvider.of<CartBloc>(context).add(
                                          CartBottomDialogAmountIncrementPressed());
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/ico_plus_amount.svg'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: AppColors.color3.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.w),
                            ),
                          ),
                          onPressed: () async {
                            await Future.delayed(Duration(milliseconds: 300));
                            BlocProvider.of<CartBloc>(context)
                                .add(CartBottomDialogAddPress());
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.w),
                            child: Text(
                              'ADD TO CART',
                              style: AppTextStyle.header5.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.color2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: AppColors.color10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 42.w, vertical: 20.h),
            height: 250.h,
            width: 345.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text("UPDATE",
                      style: AppTextStyle.header4.copyWith(
                        color: AppColors.color6,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  child: TextField(
                    cursorColor: AppColors.color8,
                    keyboardType: TextInputType.number,
                    style: AppTextStyle.paragraph
                        .copyWith(color: AppColors.color8),
                    decoration: InputDecoration(
                      hintText: "Remain",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.color3,
                            width: 2,
                            style: BorderStyle.solid),
                      ),
                      // filled: true,
                      // fillColor: AppColors.color10,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.color9,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 35.h),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 150.w, height: 45.h),
                    child: TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.color3),
                        ),
                        onPressed: () {
                          _showAlertDialog(context);
                        },
                        child: Text(
                          "Apply",
                          style: AppTextStyle.header6.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.color10),
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(product.image);
    return InkWell(
      onTap: () {
        if (role == RoleType.Seller) {
          BlocProvider.of<CartBloc>(context).add(CartBottomDialogPressed(
              selectedProduct: CartProduct.fromProduct(this.product)));

          showBottomDialog(context);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: BoxDecoration(boxShadow: [AppConstant.shadowProduct]),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Container(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.w),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    width: 114.h,
                    height: 114.h,
                    imageUrl: product.image,
                    errorWidget: (context, url, error) => Image(
                      image: AssetImage('assets/template_plant.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.name,
                                style: AppTextStyle.header5.copyWith(
                                    color: AppColors.color5,
                                    fontWeight: FontWeight.w600),
                              ),
                              page == pageOfWidget.HOME &&
                                      role != RoleType.Seller
                                  ? IconButton(
                                      constraints: BoxConstraints(),
                                      padding: EdgeInsets.zero,
                                      iconSize: 17.w,
                                      onPressed: () async {
                                        final result = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BlocProvider(
                                                  create: (context) =>
                                                      UpdateProductBloc(
                                                          product),
                                                  child: UpdateProductPage(),
                                                ),
                                              ),
                                            ) ??
                                            false;
                                        if (result == true) {
                                          BlocProvider.of<HomeBloc>(context)
                                              .add(HomeLoaded());
                                        }
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/ico_edit.svg'),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15.w),
                          child: Text(
                            product.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.header6.copyWith(
                              color: AppColors.color8,
                            ),
                          ),
                        ),
                        page == pageOfWidget.HOME
                            ? widgetOfHome()
                            : widgetofPackage(context)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
