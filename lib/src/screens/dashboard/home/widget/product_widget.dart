import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_event.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_bloc.dart';
import 'package:flower_store/src/models/product.dart';
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
  final Product product;

  const ProductWidget({
    key,
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
              style: AppTextStyle.header6.copyWith(
                color: AppColors.color5,
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
            height: 32.h,
          ),
          Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 82.w, height: 30.h),
                child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.color3),
                    ),
                    onPressed: () {
                      _showMyDialog(context);
                    },
                    child: Text(
                      "Update",
                      style: AppTextStyle.header7.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.color10),
                    )),
              ),
              SizedBox(
                width: 43.w,
              ),
              Text('Remain : 4',
                  style: AppTextStyle.header7.copyWith(color: AppColors.color6))
            ],
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
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
                          _showMyDialog(context);
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
    return Container(
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
              CachedNetworkImage(
                width: 114.w,
                height: 114.h,
                imageUrl: product.image,
                placeholder: (context, url) => SpinKitRing(
                  color: AppColors.color1,
                ),
                errorWidget: (context, url, error) => Image(
                  image: AssetImage('assets/template_plant.png'),
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
                            style: AppTextStyle.header6.copyWith(
                                color: AppColors.color5,
                                fontWeight: FontWeight.bold),
                          ),
                          page == pageOfWidget.HOME
                              ? IconButton(
                                  constraints: BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  iconSize: 17.w,
                                  onPressed: () async {
                                    final result = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BlocProvider(
                                              create: (context) =>
                                                  UpdateProductBloc(product),
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
                                  icon: SvgPicture.asset('assets/ico_edit.svg'))
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
                        style: AppTextStyle.header7.copyWith(
                          color: AppColors.color5,
                        ),
                      ),
                    ),
                    page == pageOfWidget.HOME
                        ? widgetOfHome()
                        : widgetofPackage(context)
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
